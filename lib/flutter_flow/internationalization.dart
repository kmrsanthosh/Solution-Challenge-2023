import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id', 'ms'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? idText = '',
    String? msText = '',
  }) =>
      [enText, idText, msText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    '3p97u62u': {
      'en': 'Welcome Back!',
      'id': 'Selamat Datang kembali!',
      'ms': 'Selamat kembali!',
    },
    'xkz4xjo6': {
      'en': 'Aadhar Authentication',
      'id': 'Gunakan formulir di bawah ini untuk mengakses akun Anda.',
      'ms': 'Gunakan borang di bawah untuk mengakses akaun anda.',
    },
    'k9u5spqi': {
      'en': '',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'f4xxyrqv': {
      'en': 'Enter Your Aadhar Number Here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'zy328lg7': {
      'en': 'Alternatively Scan QR Code Of Aadhar Card',
      'id': 'Gunakan platform sosial untuk melanjutkan',
      'ms': 'Gunakan platform sosial untuk meneruskan',
    },
    'wisa07p2': {
      'en': 'Login as Contractor',
      'id': '',
      'ms': '',
    },
    'jkmrvxk8': {
      'en': 'GetCode',
      'id': '',
      'ms': '',
    },
    '7mihx11z': {
      'en': 'Scan QR',
      'id': '',
      'ms': '',
    },
    '33rd9g2l': {
      'en': 'Cancel',
      'id': '',
      'ms': '',
    },
    'iha5socs': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // forgotPassword
  {
    '3hcuc8v6': {
      'en': 'Forgot Password',
      'id': 'Tidak ingat kata sandi',
      'ms': 'Lupa kata laluan',
    },
    'sjjd1jb9': {
      'en':
          'Don\'t remember your password? Enter the Aadhar number associated with your account below and we will send you a new link.',
      'id':
          'Tidak ingat kata sandi Anda? Masukkan email yang terkait dengan akun Anda di bawah ini dan kami akan mengirimkan tautan baru kepada Anda.',
      'ms':
          'Tidak ingat kata laluan anda? Masukkan e-mel yang dikaitkan dengan akaun anda di bawah dan kami akan menghantar pautan baharu kepada anda.',
    },
    'tzm5opaa': {
      'en': 'Aadhar Number',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'uvsotzng': {
      'en': 'Please enter a valid Aadhar number...',
      'id': 'Tolong masukkan email yang benar...',
      'ms': 'Sila masukkan e-mel yang sah...',
    },
    '3sdzjivm': {
      'en': 'Send Reset Link',
      'id': 'Kirim Setel Ulang Tautan',
      'ms': 'Hantar Pautan Tetapan Semula',
    },
    '8p6xd6cl': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // Home
  {
    '3bi54x5g': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'nnv46x35': {
      'en': 'Below is a summary of your team',
      'id': 'Di bawah ini adalah ringkasan aktivitas tim Anda.',
      'ms': 'Di bawah ialah ringkasan aktiviti pasukan anda.',
    },
    'jqevo63s': {
      'en': 'Worker\'s at site',
      'id': 'pelanggan baru',
      'ms': 'pelanggan baru',
    },
    'd0r4w3cc': {
      'en': '24',
      'id': '24',
      'ms': '24',
    },
    '8vot9bzj': {
      'en': 'Number of active  projects',
      'id': 'Kontrak Baru',
      'ms': 'Kontrak Baru',
    },
    '463rfkem': {
      'en': '7',
      'id': '3.200',
      'ms': '3,200',
    },
    'saxskj92': {
      'en': 'Completed Projects',
      'id': 'Kontrak Kedaluwarsa',
      'ms': 'Kontrak Tamat',
    },
    '2wlrr5lg': {
      'en': '50',
      'id': '4300',
      'ms': '4300',
    },
    'kphqz3hi': {
      'en': 'Projects',
      'id': 'Proyek',
      'ms': 'Projek',
    },
    'xlzf8qqx': {
      'en': 'Godrej Splendour',
      'id': 'Tim Desain UI',
      'ms': 'Pasukan Reka Bentuk UI',
    },
    'zt3s5l2s': {
      'en': '400 workers at site now',
      'id': '4 Anggota',
      'ms': '4 Ahli',
    },
    'puy8obok': {
      'en': 'Contract Activity',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'zlovh0zt': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'g1uaaovn': {
      'en': 'Customer Activity',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'e5q3ows1': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'uj7jsxmo': {
      'en': 'Overall Completion',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'hkk2zmjw': {
      'en': 'Summary of project status',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'jkgae0vc': {
      'en': 'All active workers',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'g4os7kcp': {
      'en': 'Summary of all current active workers',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'y24lcr13': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'xdxbdj20': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Main_customerList
  {
    'n99lg1qh': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    'lvnskphp': {
      'en': 'All',
      'id': 'Semua',
      'ms': 'Semua',
    },
    'a258xeav': {
      'en': 'Name Here',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'wduyui67': {
      'en': 'Designation Here',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    'riw99ssl': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'u0su8kte': {
      'en': 'Name Here',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'nyfsg4hw': {
      'en': 'Designation Here',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    'gzwu4cjr': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'v1ffzm93': {
      'en': 'Name Here',
      'id': 'Rodriguez yang kejam',
      'ms': 'Ignacious Rodriguez',
    },
    '8jo402mn': {
      'en': 'Designation Here',
      'id': 'Manajer penjualan',
      'ms': 'Pengurus jualan',
    },
    'r658c9dm': {
      'en': 'Project Name Here',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'l5cpbw6i': {
      'en': 'Name Here',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
    },
    '9ico69uv': {
      'en': 'Designation Here',
      'id': 'Kepala Produk &amp; Inovasi',
      'ms': 'Ketua Produk &amp; Inovasi',
    },
    'i1898004': {
      'en': 'Project Name Here',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    's8kuamom': {
      'en': 'Name Here',
      'id': 'Greg Brown',
      'ms': 'Greg Brown',
    },
    'uu60i528': {
      'en': 'Designation Here',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    '6nuzim8s': {
      'en': 'Project Name here',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'lwflemu4': {
      'en': 'Name Here',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    'rxejb1ds': {
      'en': 'Designation Here',
      'id': 'Manajer Akun Senior',
      'ms': 'Tuan Pengurus Akaun',
    },
    'k5yutyp7': {
      'en': 'Project Name here',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'z6bqikmn': {
      'en': 'Name Here',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    'rm4hba82': {
      'en': 'Designation Here',
      'id': 'Manajer Akun Senior',
      'ms': 'Tuan Pengurus Akaun',
    },
    'id05iiyh': {
      'en': 'Project Name here',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'qh2ock0d': {
      'en': 'Active',
      'id': 'Aktif',
      'ms': 'Aktif',
    },
    'evmi1fjb': {
      'en': 'Name Here',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    '7t7dfs7b': {
      'en': 'Designation Here',
      'id': 'Manajer Akun Senior',
      'ms': 'Tuan Pengurus Akaun',
    },
    'rv0grt5f': {
      'en': 'Project Name Here',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    '1c1n7s8k': {
      'en': 'Name Here',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    '13p4ybb4': {
      'en': 'Designation Here',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    'y7tux8cs': {
      'en': 'Project Name Here',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    's7xebw09': {
      'en': 'Inactive',
      'id': 'Panggilan Dingin',
      'ms': 'Panggilan Dingin',
    },
    'xaq75cfo': {
      'en': 'Name Here',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    '3hsvv2b4': {
      'en': 'Designation Here',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    '8df6l0nu': {
      'en': 'Project Name Here',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    '1azw03n0': {
      'en': 'Name Here',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
    },
    '4i0nlpng': {
      'en': 'Designation Here',
      'id': 'Kepala Produk &amp; Inovasi',
      'ms': 'Ketua Produk &amp; Inovasi',
    },
    'k60lznjm': {
      'en': 'Project Name Here',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'fcyoodds': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '3ourv2w9': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Main_Contracts
  {
    '4h88trkp': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'smh1o93d': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    't967eizl': {
      'en': 'Projects',
      'id': 'Proyek',
      'ms': 'Projek',
    },
    'dpt94d56': {
      'en': 'Warehouse construction',
      'id': 'Desain Platform Tanpa Kode',
      'ms': 'Reka Bentuk Platform Tanpa Kod',
    },
    '2a7y5e2w': {
      'en': 'Gardening',
      'id': 'Dokumen Tim Desain',
      'ms': 'Dokumen Pasukan Reka Bentuk',
    },
    'dlt46loo': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'sqmgdsam': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    '8t72ssfn': {
      'en': 'Contracts for New Opportunities',
      'id': 'Kontrak untuk Peluang Baru',
      'ms': 'Kontrak untuk Peluang Baru',
    },
    'h9kiq8rj': {
      'en': 'Next Action',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    '7mjz03wi': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    '8e820p1r': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    '7wcrhzda': {
      'en': 'JayPee Group',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'sen48p1q': {
      'en': 'Client Acquisition for Q3',
      'id': 'Akuisisi Klien untuk Q3',
      'ms': 'Pemerolehan Pelanggan untuk S3',
    },
    'fp6xlmv9': {
      'en': 'Next Action',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    'k0rirjak': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'nanoxp6w': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    'j08eiorc': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // myTeam
  {
    '8jlklje5': {
      'en': 'My Team',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    '9iuss6gl': {
      'en': 'Search for your customers...',
      'id': 'Cari pelanggan Anda...',
      'ms': 'Cari pelanggan anda...',
    },
    '5mtplc2u': {
      'en': 'Member Name',
      'id': 'Nama anggota',
      'ms': 'Nama ahli',
    },
    'xsqhz5g4': {
      'en': 'Email',
      'id': 'Surel',
      'ms': 'E-mel',
    },
    'xkijgi68': {
      'en': 'Last Active',
      'id': 'Aktif Terakhir',
      'ms': 'Aktif Terakhir',
    },
    'dtsi2m5j': {
      'en': 'Date Created',
      'id': 'Tanggal Diciptakan',
      'ms': 'Tarikh Dibuat',
    },
    'qriboqj2': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    'yxvgnrrg': {
      'en': 'santhosh',
      'id': 'Alex Smith',
      'ms': 'Alex Smith',
    },
    'hbvgee7f': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'cxqbcilh': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'mv4x7wmh': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    'w2zw9cr7': {
      'en': 'shrinivas',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    '975lfxpw': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'cr4tpu01': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    '65466g2l': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    '6wt4aamp': {
      'en': 'srinivas karthik',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    'l96eacgw': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'l2l3xguz': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'j5fz217z': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    'aa3kj1vf': {
      'en': 'sugindar',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    'a34fke7r': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'anzvwh88': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'pmybqcyj': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    'ejpiipnj': {
      'en': 'vaseekaran',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    'xhwmudov': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    '55rj4ws9': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    '7fin6z7v': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    '54fbheio': {
      'en': 'Chitti Babu',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    '5zdg3l5v': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'pfrreymz': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'r47lqzrc': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    'ym579y79': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'smtxdnbn': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Main_profilePage
  {
    'qrxn5crt': {
      'en': 'My Profile',
      'id': 'Profil saya',
      'ms': 'Profil saya',
    },
    'v1hh7jlp': {
      'en': 'Switch to Dark Mode',
      'id': 'Beralih ke Mode Gelap',
      'ms': 'Tukar kepada Mod Gelap',
    },
    'sh7q15l6': {
      'en': 'Switch to Light Mode',
      'id': 'Beralih ke Mode Cahaya',
      'ms': 'Tukar kepada Mod Cahaya',
    },
    'fyxsf6vn': {
      'en': 'Account Settings',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    'h43llaan': {
      'en': 'Change Password',
      'id': 'Ganti kata sandi',
      'ms': 'Tukar kata laluan',
    },
    'b1lw0hfu': {
      'en': 'Edit Profile',
      'id': 'Sunting profil',
      'ms': 'Sunting profil',
    },
    'abqf147c': {
      'en': 'Log Out',
      'id': 'Keluar',
      'ms': 'Log keluar',
    },
    'o3dp9tss': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // userDetails
  {
    'obyrn1rb': {
      'en': 'Customer Name',
      'id': 'Nama Pelanggan',
      'ms': 'Nama Pelanggan',
    },
    '00sam6zz': {
      'en': 'Ramaswamy Murugan',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'nxuoeukv': {
      'en': 'High Profile',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'ecbeopja': {
      'en': 'Title',
      'id': 'Judul',
      'ms': 'Tajuk',
    },
    'xf6clrz6': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    'kl55bl1c': {
      'en': 'Company',
      'id': 'Perusahaan',
      'ms': 'Syarikat',
    },
    'nh9bkr5i': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'dkyygm1d': {
      'en': 'Notes',
      'id': 'Catatan',
      'ms': 'Nota',
    },
    'p82rjlf3': {
      'en': 'Alexandria Smith',
      'id': 'Alexandria Smith',
      'ms': 'Alexandria Smith',
    },
    '2s53b50t': {
      'en': '1m ago',
      'id': '1 menit yang lalu',
      'ms': '1m lalu',
    },
    'rnaiavvh': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'id':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'ms':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laboure et dolore magna aliqua. Untuk meminimumkan veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    'bujmmf46': {
      'en': '8',
      'id': '8',
      'ms': '8',
    },
    'ntlrz0gk': {
      'en': 'Notes',
      'id': 'Catatan',
      'ms': 'Nota',
    },
    'rw21s3dk': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'mj096u71': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'id':
          'Saya tidak begitu yakin tentang bagian ini di sini saya pikir Anda harus melakukan sesuatu yang keren!',
      'ms':
          'Saya tidak begitu pasti tentang bahagian ini di sini kerana saya fikir anda perlu melakukan sesuatu yang menarik!',
    },
    '1n2y2xin': {
      'en': 'a min ago',
      'id': 'beberapa menit yang lalu',
      'ms': 'min yang lalu',
    },
    'ojneuoau': {
      'en': 'Generate Quote',
      'id': 'Hasilkan Penawaran',
      'ms': 'Hasilkan Petikan',
    },
    'suvzdvvk': {
      'en': 'View Company',
      'id': 'Lihat Perusahaan',
      'ms': 'Lihat Syarikat',
    },
    '9t913b44': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // editProfile
  {
    'mk8nnw94': {
      'en': 'Change Photo',
      'id': '',
      'ms': '',
    },
    '4no7ue4a': {
      'en': 'Your Name',
      'id': '',
      'ms': '',
    },
    '2rqce1pj': {
      'en': 'The email associated with this account is:',
      'id': '',
      'ms': '',
    },
    'rr8ksatz': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
    },
    '20uycztj': {
      'en': 'Edit Profile',
      'id': '',
      'ms': '',
    },
  },
  // projectDetailsHealthAi
  {
    'mxf4vrjw': {
      'en': 'JayPee Groups',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'wsgonkz2': {
      'en': 'Client Acquisition for Q3',
      'id': 'Akuisisi Klien untuk Q3',
      'ms': 'Pemerolehan Pelanggan untuk S3',
    },
    'ynyuwhqo': {
      'en': 'Next Action',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    'zk7z07v0': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'lux9j0yp': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    'ry6jvd0g': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    'hu32scl5': {
      'en': 'Rs.1,25,000',
      'id': '\$125.000',
      'ms': '\$125,000',
    },
    'sfu6o269': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    '5sv9a4ka': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    'rrgcwkj1': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    '8bwk4oui': {
      'en': 'Rs.67,000',
      'id': '\$67.000',
      'ms': '\$67,000',
    },
    'p2hoxaq9': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    'ww95wm3k': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    '54l7ivhw': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // projectDetails
  {
    'olng4jgs': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'auzixtnu': {
      'en': 'Contracts for New Opportunities',
      'id': 'Kontrak untuk Peluang Baru',
      'ms': 'Kontrak untuk Peluang Baru',
    },
    'b5izv7nf': {
      'en': 'Next Action',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    'vhaascws': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'u5if4r56': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    'xmoxp4eg': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    'nftjvt9b': {
      'en': 'Rs.2,10,000',
      'id': '\$210.000',
      'ms': '\$210,000',
    },
    'gpz3q8k6': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    'yltv0mu8': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    'rqfytlxg': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    'dlykg4gm': {
      'en': 'Rs.1,20,000',
      'id': '\$120,000',
      'ms': '\$120,000',
    },
    'hsx3k6c4': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    'okb12i1r': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    'c0s3jdsy': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // searchPage
  {
    'ao46xsuv': {
      'en': 'Add Members',
      'id': 'Tambahkan Anggota',
      'ms': 'Tambah Ahli',
    },
    'g8rv8zhr': {
      'en': 'Search members...',
      'id': 'Cari anggota...',
      'ms': 'Cari ahli...',
    },
    'op7ngmsb': {
      'en': 'Option 1',
      'id': 'Pilihan 1',
      'ms': 'Pilihan 1',
    },
    '5x8u4g0u': {
      'en': 'Add Members',
      'id': 'Tambahkan Anggota',
      'ms': 'Tambah Ahli',
    },
    '4cek35uo': {
      'en': 'View',
      'id': 'Melihat',
      'ms': 'Lihat',
    },
    'mvx2sb5k': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // PaymentPage
  {
    '3z3enu30': {
      'en': 'Payment Detail',
      'id': '',
      'ms': '',
    },
    'i4f80a17': {
      'en': 'Amount',
      'id': '',
      'ms': '',
    },
    '8no9gtbz': {
      'en': '₹ 25,000',
      'id': '',
      'ms': '',
    },
    '42clj2k8': {
      'en': 'Project Name',
      'id': '',
      'ms': '',
    },
    'bmjpsw56': {
      'en': 'Godrej Splendor -Electrical transportation equipment installing',
      'id': '',
      'ms': '',
    },
    'qobyhpgi': {
      'en': 'When',
      'id': '',
      'ms': '',
    },
    'c4z9pihj': {
      'en': 'Yesterday,',
      'id': '',
      'ms': '',
    },
    'j3fkvfcz': {
      'en': 'Jan 26, 10:00am',
      'id': '',
      'ms': '',
    },
    'k76oso5g': {
      'en': 'Project Details',
      'id': '',
      'ms': '',
    },
    'm9ws5p06': {
      'en': 'Electrical transportation equipment installing',
      'id': '',
      'ms': '',
    },
    '48kojmeg': {
      'en': 'Project Admin',
      'id': '',
      'ms': '',
    },
    'c8kz92wq': {
      'en': 'Guru Ram',
      'id': '',
      'ms': '',
    },
    'tjrs8a77': {
      'en': '+91 1234567891',
      'id': '',
      'ms': '',
    },
    'wkl7agsw': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // HomeConnect
  {
    'olklvqeu': {
      'en': 'Mariappan\nElectrician',
      'id': '',
      'ms': '',
    },
    'u1at4xyx': {
      'en': 'Completed Jobs ',
      'id': '',
      'ms': '',
    },
    '368xzbyp': {
      'en': '24',
      'id': '',
      'ms': '',
    },
    'wh904n0v': {
      'en': 'Pending Jobs',
      'id': '',
      'ms': '',
    },
    'kl6lxhoz': {
      'en': '16',
      'id': '',
      'ms': '',
    },
    'eto9epg8': {
      'en': 'Experience',
      'id': '',
      'ms': '',
    },
    'twi1ocs2': {
      'en': '13 Years',
      'id': '',
      'ms': '',
    },
    'w2s10684': {
      'en': '0-RS:20000',
      'id': '',
      'ms': '',
    },
    'v1kfr1wv': {
      'en': 'RS:20000-RS:100000',
      'id': '',
      'ms': '',
    },
    'angdwzvl': {
      'en': 'Above RS:100000',
      'id': '',
      'ms': '',
    },
    'b8wprq9f': {
      'en': 'Salary Expecting',
      'id': '',
      'ms': '',
    },
    'tppcy423': {
      'en': 'Projects',
      'id': '',
      'ms': '',
    },
    'rm0mzvbv': {
      'en': 'Electrical transportation equipment installing',
      'id': '',
      'ms': '',
    },
    '3w9hdd0f': {
      'en': 'Needed:4 Members',
      'id': '',
      'ms': '',
    },
    's9jam7ur': {
      'en': 'Work Starts at',
      'id': '',
      'ms': '',
    },
    '636zfguc': {
      'en': 'Mon, 24',
      'id': '',
      'ms': '',
    },
    'zab1f3lq': {
      'en': '4:00pm',
      'id': '',
      'ms': '',
    },
    'yh5jxwoc': {
      'en': 'Work Want To Be Completed Within 30 Days',
      'id': '',
      'ms': '',
    },
    '2z91ozp6': {
      'en': 'Electrical transportation equipment Repairing',
      'id': '',
      'ms': '',
    },
    'cwnmqrth': {
      'en': 'Needed:4 Members',
      'id': '',
      'ms': '',
    },
    'j7m0ywsg': {
      'en': 'Work Starts at',
      'id': '',
      'ms': '',
    },
    '9rid2g0z': {
      'en': 'Mon, 24',
      'id': '',
      'ms': '',
    },
    'd1ht9n68': {
      'en': '4:00pm',
      'id': '',
      'ms': '',
    },
    'heijfb07': {
      'en': 'Work Want To Be Completed Within 20 Days',
      'id': '',
      'ms': '',
    },
    'cvq3rt8n': {
      'en': ' First-line supervisor',
      'id': '',
      'ms': '',
    },
    'sxmgwpiy': {
      'en': 'Needed:2 Members',
      'id': '',
      'ms': '',
    },
    'gndqye6r': {
      'en': 'Work Starts at',
      'id': '',
      'ms': '',
    },
    'jc8t2ea0': {
      'en': 'Mon, 24',
      'id': '',
      'ms': '',
    },
    'bn9wxx2b': {
      'en': '4:00pm',
      'id': '',
      'ms': '',
    },
    'aok5uci2': {
      'en': 'Work Want To Be Completed Within 90 Days',
      'id': '',
      'ms': '',
    },
    'xsg3juyg': {
      'en': 'HOME',
      'id': '',
      'ms': '',
    },
    '73rlk7uf': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // onboardingscreen1
  {
    'kvnjibau': {
      'en': 'Aadhar Authetication',
      'id': '',
      'ms': '',
    },
    'w5v1pkmo': {
      'en':
          'Join a community of blue-collar workers like never before! Our simple and secure Aadhar based authentication allows you to effortlessly create your profile and instantly access government welfare benefits with just a few taps on your screen.',
      'id': '',
      'ms': '',
    },
    '5qf6yld6': {
      'en': 'Worry-Free Payment',
      'id': '',
      'ms': '',
    },
    'bdj1y7pg': {
      'en':
          'Say goodbye to worries about payment! With Blue Connect, you can complete your work with confidence knowing that payment will be automatically processed to your bank account once the job is done.',
      'id': '',
      'ms': '',
    },
    '3xebn8ae': {
      'en': 'Safety and Security',
      'id': '',
      'ms': '',
    },
    '1mlwtdee': {
      'en':
          'Join Blue Connect for a safer and more secure future for blue-collar workers in India. We share critical data with the government to prevent exploitation, molestation, and illegal money transfers.',
      'id': '',
      'ms': '',
    },
    'ijrgg741': {
      'en': 'Continue',
      'id': '',
      'ms': '',
    },
  },
  // Pincode
  {
    'vlxq5c51': {
      'en': 'Confirm your Code',
      'id': '',
      'ms': '',
    },
    'xu77lqi7': {
      'en': 'This code helps keep your account safe and secure.',
      'id': '',
      'ms': '',
    },
    'w3p8k3lb': {
      'en': 'Confirm & Continue',
      'id': '',
      'ms': '',
    },
    'bh0quayy': {
      'en': 'Blue Connect',
      'id': '',
      'ms': '',
    },
    'mhwe6tvl': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // LanguageSelection
  {
    'pcrpbrwz': {
      'en': 'Pick your',
      'id': '',
      'ms': '',
    },
    'kwd77gdz': {
      'en': ' Language',
      'id': '',
      'ms': '',
    },
    '54fzyl3z': {
      'en': 'English',
      'id': '',
      'ms': '',
    },
    '7xh24ax4': {
      'en': 'हिंदी',
      'id': '',
      'ms': '',
    },
    'ph21tg31': {
      'en': 'தமிழ்',
      'id': '',
      'ms': '',
    },
    'iry2y2o3': {
      'en': 'मराठी',
      'id': '',
      'ms': '',
    },
    '1hr6nwn7': {
      'en': 'తెలుగు',
      'id': '',
      'ms': '',
    },
    'u5bdyaqp': {
      'en': 'ગુજરાતી',
      'id': '',
      'ms': '',
    },
    '52kyy3ib': {
      'en': 'اردو',
      'id': '',
      'ms': '',
    },
    '0fn9gvsm': {
      'en': 'ಕನ್ನಡ',
      'id': '',
      'ms': '',
    },
    'rakk9ilk': {
      'en': 'ଓଡିଆ',
      'id': '',
      'ms': '',
    },
    'w5hkcfd9': {
      'en': 'Continue',
      'id': '',
      'ms': '',
    },
    'ow7ci82x': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // HomeTamil
  {
    'fi21raj2': {
      'en': 'டாஷ்போர்டு',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'fycgs2ss': {
      'en': 'உங்கள் குழுவின் சுருக்கம் கீழே உள்ளது',
      'id': 'Di bawah ini adalah ringkasan aktivitas tim Anda.',
      'ms': 'Di bawah ialah ringkasan aktiviti pasukan anda.',
    },
    '0651wbyf': {
      'en': 'தளத்தில் தொழிலாளி',
      'id': 'pelanggan baru',
      'ms': 'pelanggan baru',
    },
    '95wro53z': {
      'en': '24',
      'id': '24',
      'ms': '24',
    },
    '7hksvl2j': {
      'en': 'செயலில் உள்ள திட்டங்களின் எண்ணிக்கை',
      'id': 'Kontrak Baru',
      'ms': 'Kontrak Baru',
    },
    'u66aer9z': {
      'en': '7',
      'id': '3.200',
      'ms': '3,200',
    },
    'x587f5cm': {
      'en': 'Completed Projects',
      'id': 'Kontrak Kedaluwarsa',
      'ms': 'Kontrak Tamat',
    },
    '3yekx6bu': {
      'en': '50',
      'id': '4300',
      'ms': '4300',
    },
    'zhmo5fx9': {
      'en': 'Projects',
      'id': 'Proyek',
      'ms': 'Projek',
    },
    'rwbedr0x': {
      'en': 'கோத்ரெஜ் ஸ்பிளெண்டர்',
      'id': 'Tim Desain UI',
      'ms': 'Pasukan Reka Bentuk UI',
    },
    'eni68k8o': {
      'en': 'தற்போது 400 தொழிலாளர்கள் பணியில் உள்ளனர்',
      'id': '4 Anggota',
      'ms': '4 Ahli',
    },
    'yq39hnjx': {
      'en': 'Contract Activity',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    '42eo660q': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'kmt8nwl1': {
      'en': 'Customer Activity',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'yjbg616o': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'yiicoptm': {
      'en': 'ஒட்டுமொத்த நிறைவு',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    '963sfhav': {
      'en': 'திட்ட நிலையின் சுருக்கம்',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    '7zq9y4hw': {
      'en': 'அனைத்து செயலில் உள்ள தொழிலாளர்கள்',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'w1utyzqw': {
      'en': 'தற்போது செயல்படும் அனைத்து தொழிலாளர்களின் சுருக்கம்',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    '3jguocw0': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'yjkr8d92': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // HomeHindi
  {
    '9t3wj2jd': {
      'en': 'डैशबोर्ड',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    '6q9rv6l8': {
      'en': 'नीचे आपके समूह का सारांश है',
      'id': 'Di bawah ini adalah ringkasan aktivitas tim Anda.',
      'ms': 'Di bawah ialah ringkasan aktiviti pasukan anda.',
    },
    's5ei3b3m': {
      'en': 'साइट पर कार्यकर्ता',
      'id': 'pelanggan baru',
      'ms': 'pelanggan baru',
    },
    '7bga6kpa': {
      'en': '24',
      'id': '24',
      'ms': '24',
    },
    'dxr7bsi7': {
      'en': 'सक्रिय परियोजनाओं की संख्या',
      'id': 'Kontrak Baru',
      'ms': 'Kontrak Baru',
    },
    'sy8owtwq': {
      'en': '7',
      'id': '3.200',
      'ms': '3,200',
    },
    'q8ruzilc': {
      'en': 'Completed Projects',
      'id': 'Kontrak Kedaluwarsa',
      'ms': 'Kontrak Tamat',
    },
    '8zlivwyi': {
      'en': '50',
      'id': '4300',
      'ms': '4300',
    },
    'ua8uxowz': {
      'en': 'Projects',
      'id': 'Proyek',
      'ms': 'Projek',
    },
    '5i8jg88n': {
      'en': 'गोदरेज स्प्लेंडर',
      'id': 'Tim Desain UI',
      'ms': 'Pasukan Reka Bentuk UI',
    },
    'eom2dwiv': {
      'en': 'वर्तमान में 400 कर्मचारी कार्यरत हैं',
      'id': '4 Anggota',
      'ms': '4 Ahli',
    },
    'c5abeowk': {
      'en': 'Contract Activity',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'h72g2zhg': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    '1d68m3mj': {
      'en': 'Customer Activity',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'xbyfh1hm': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    '95dxfi6o': {
      'en': 'समग्र समापन',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'rwqnupei': {
      'en': 'परियोजना की स्थिति का सारांश',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'k9gsc4ye': {
      'en': 'सभी सक्रिय कार्यकर्ता',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'cyulabx1': {
      'en': 'सभी मौजूदा सक्रिय कर्मचारियों का सारांश',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'w15kyrxw': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'fmzfbu2f': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Splash
  {
    'cq7vjdv4': {
      'en': 'Blue Connect',
      'id': '',
      'ms': '',
    },
  },
  // LoginCopy
  {
    '1r345pfs': {
      'en': 'Welcome Back!',
      'id': 'Selamat Datang kembali!',
      'ms': 'Selamat kembali!',
    },
    'ac48jjz7': {
      'en': 'Aadhar Authentication',
      'id': 'Gunakan formulir di bawah ini untuk mengakses akun Anda.',
      'ms': 'Gunakan borang di bawah untuk mengakses akaun anda.',
    },
    'hzitucbe': {
      'en': '',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'fxdhrz7k': {
      'en': 'Enter Your Aadhar Number Here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'huu1adx7': {
      'en': 'Alternatively Scan QR Code Of Aadhar Card',
      'id': 'Gunakan platform sosial untuk melanjutkan',
      'ms': 'Gunakan platform sosial untuk meneruskan',
    },
    'x0kz505j': {
      'en': 'Login as Contractor',
      'id': '',
      'ms': '',
    },
    '304mp8q1': {
      'en': 'GetCode',
      'id': '',
      'ms': '',
    },
    'ca8cb2o2': {
      'en': 'Scan QR',
      'id': '',
      'ms': '',
    },
    '1c5g01ep': {
      'en': 'Cancel',
      'id': '',
      'ms': '',
    },
    'hna7ca9j': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // PincodeCopy
  {
    'm8r6flax': {
      'en': 'Confirm your Code',
      'id': '',
      'ms': '',
    },
    'd2t97gtv': {
      'en': 'This code helps keep your account safe and secure.',
      'id': '',
      'ms': '',
    },
    'kz2ifghv': {
      'en': 'Confirm & Continue',
      'id': '',
      'ms': '',
    },
    '0bmy0ut6': {
      'en': 'Blue Connect',
      'id': '',
      'ms': '',
    },
    'plv5014i': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // LanguageSelectionCopy
  {
    'qda1w8rh': {
      'en': 'Pick your',
      'id': '',
      'ms': '',
    },
    'osk4exds': {
      'en': ' Language',
      'id': '',
      'ms': '',
    },
    'd21ignp2': {
      'en': 'English',
      'id': '',
      'ms': '',
    },
    '17dyhdps': {
      'en': 'हिंदी',
      'id': '',
      'ms': '',
    },
    '296lq1r0': {
      'en': 'தமிழ்',
      'id': '',
      'ms': '',
    },
    'sz9eqbgg': {
      'en': 'मराठी',
      'id': '',
      'ms': '',
    },
    'fguug97u': {
      'en': 'తెలుగు',
      'id': '',
      'ms': '',
    },
    'sqkppoxz': {
      'en': 'ગુજરાતી',
      'id': '',
      'ms': '',
    },
    '66zgwa2j': {
      'en': 'اردو',
      'id': '',
      'ms': '',
    },
    '6ls36koy': {
      'en': 'ಕನ್ನಡ',
      'id': '',
      'ms': '',
    },
    '1z0gwmah': {
      'en': 'ଓଡିଆ',
      'id': '',
      'ms': '',
    },
    'qejvoqhl': {
      'en': 'Continue',
      'id': '',
      'ms': '',
    },
    'hys5002h': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // modal_success
  {
    'kred63vb': {
      'en': 'Send Contract Confirmation',
      'id': 'Kirim Konfirmasi Kontrak',
      'ms': 'Hantar Pengesahan Kontrak',
    },
    'hywgg8eu': {
      'en': 'A new contract has been generated for:',
      'id': 'Kontrak baru telah dibuat untuk:',
      'ms': 'Kontrak baru telah dijana untuk:',
    },
    'kmp2gbpy': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'a7nc1dt4': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    '2f2nxucv': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'vcm4fijj': {
      'en': 'Next Steps',
      'id': 'Langkah selanjutnya',
      'ms': 'Langkah seterusnya',
    },
    '60n0fqw5': {
      'en':
          'Send the information below. And we will send an email with details to the customer and allow you to manage it in your dashboard.',
      'id':
          'Kirim informasi di bawah ini. Dan kami akan mengirimkan email dengan detail kepada pelanggan dan memungkinkan Anda untuk mengelolanya di dasbor Anda.',
      'ms':
          'Hantar maklumat di bawah. Dan kami akan menghantar e-mel dengan butiran kepada pelanggan dan membenarkan anda mengurusnya dalam papan pemuka anda.',
    },
    'e408bhw6': {
      'en': 'Send Information',
      'id': 'Kirim Informasi',
      'ms': 'Hantar Maklumat',
    },
    'wo1onxhi': {
      'en': 'Never Mind',
      'id': 'Sudahlah',
      'ms': 'Tidak mengapa',
    },
  },
  // modal_Message
  {
    'wa4vkne2': {
      'en': 'Congratulations!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    '3hf2ocig': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'id':
          'Sekarang kontrak telah dibuat untuk pelanggan ini, silakan hubungi mereka dengan tanggal Anda akan mengirim perjanjian yang ditandatangani.',
      'ms':
          'Memandangkan kontrak telah dijana untuk pelanggan ini, sila hubungi mereka dengan tarikh anda akan menghantar perjanjian yang ditandatangani.',
    },
    'q0jvi1lp': {
      'en': 'Okay',
      'id': 'Oke',
      'ms': 'baik',
    },
    'oo4y13nf': {
      'en': 'Continue',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // modal_Welcome
  {
    '00flvi93': {
      'en': 'Congratulations!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    'fmzceh74': {
      'en': 'A new contract has been generated for:',
      'id': 'Kontrak baru telah dibuat untuk:',
      'ms': 'Kontrak baru telah dijana untuk:',
    },
    'g8q2u55w': {
      'en': 'Continue',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // createComment
  {
    'l2jlnhye': {
      'en': 'Create Note',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
    'd6yfe8tj': {
      'en': 'Find members by searching below',
      'id': 'Temukan anggota dengan mencari di bawah',
      'ms': 'Cari ahli dengan mencari di bawah',
    },
    'p3rj5ra0': {
      'en': 'Ricky Rodriguez',
      'id': 'Ricky Rodriguez',
      'ms': 'Ricky Rodriguez',
    },
    '9gf6o5ss': {
      'en': 'Enter your note here...',
      'id': 'Masukkan catatan Anda di sini...',
      'ms': 'Masukkan nota anda di sini...',
    },
    'farrki57': {
      'en': 'Create Note',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
  },
  // mobileNav
  {
    'sy0pxvma': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    't5c3aiuy': {
      'en': 'My Team',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'nkz3c58a': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '1mkyyjwj': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'eg79coc6': {
      'en': 'Profile',
      'id': 'Profil',
      'ms': 'Profil',
    },
  },
  // webNav
  {
    'xai8ocja': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
    },
    'yg07zi4c': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    '5s0d776i': {
      'en': 'My Team',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'lbojdpxg': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '9pjba90p': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    '01nu9cy0': {
      'en': 'Profile',
      'id': 'Profil',
      'ms': 'Profil',
    },
  },
  // commandPalette
  {
    'jt9g5o8v': {
      'en': 'Search platform...',
      'id': 'Cari platform...',
      'ms': 'Platform carian...',
    },
    'b3bd9y8w': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
    },
    'pw6kvl1f': {
      'en': 'Quick Links',
      'id': 'tautan langsung',
      'ms': 'Pautan Pantas',
    },
    'gckukxjv': {
      'en': 'Find Contract',
      'id': 'Temukan Kontrak',
      'ms': 'Cari Kontrak',
    },
    'zsq8vj02': {
      'en': 'Find Customer',
      'id': 'Temukan Pelanggan',
      'ms': 'Cari Pelanggan',
    },
    'iqxwv326': {
      'en': 'New Contract',
      'id': 'Kontrak baru',
      'ms': 'Kontrak Baru',
    },
    's60yfg0g': {
      'en': 'New Customer',
      'id': 'Pelanggan baru',
      'ms': 'Pelanggan baru',
    },
    'lwrh59bb': {
      'en': 'Recent Searches',
      'id': 'pencarian terkini',
      'ms': 'Carian Terkini',
    },
    'o6lqlfr1': {
      'en': 'Newport Financ',
      'id': 'Keuangan Newport',
      'ms': 'Kewangan Newport',
    },
    '6zpaywwg': {
      'en': 'Harry Styles',
      'id': 'Harry Styles',
      'ms': 'gaya Harry',
    },
  },
  // editProfilePhoto
  {
    '6bnefz1c': {
      'en': 'Change Photo',
      'id': '',
      'ms': '',
    },
    'yaxe7q8v': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'id': '',
      'ms': '',
    },
    're4x0sz7': {
      'en': 'Upload Image',
      'id': '',
      'ms': '',
    },
    'sr54fsk6': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
    },
  },
  // Miscellaneous
  {
    '01zulvel': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'jvzz7rdf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '65e2tfs2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ddazihx4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'db03cpjj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fdb9078p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '80ouzj9q': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '6rzhptp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ce8c4ty0': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kcvqa08x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dqrzd6sq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dpqtohyf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v01vf71s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'gcv6def1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'um9es99m': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'o4enbz4j': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8z4tvfh7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2ybzla8x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'd1wdf5i1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ye5sanok': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2py80kgi': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'p6lsrh2a': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ne8cclp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
