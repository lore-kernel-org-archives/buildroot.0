From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Dec 2014 00:03:40 +0100
Subject: [Buildroot] Buildroot autobuilders - Cleanup faulty tarballs
Message-ID: <20141215230340.GB4075@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello gyus!

You all have one or more autobuilders submitting results. Thank you for
the efforts of running them! :-)

Recently, SourceForge has started to act strangely, and can serve faulty
tarballs. Those break the build, especially since a lot of packages do
not yet have a .hash file.

I am in the process of adding hashes for all SourceForget hosted
packages, but in the meantime, the build failures continue to pile up.

Could you please remove the tarballs from SF-hosted packages on each
autobuilder instance you are running, please? You'll find that list
below.

Thank you!

Regards,
Yann E. MORIN.


    Package                  Tarball
    -----------------------------------------------------------
    acpid                    acpid-2.0.22.tar.xz
    aespipe                  aespipe-v2.4c.tar.bz2
    armadillo                armadillo-4.000.4.tar.gz
    beecrypt                 beecrypt-4.2.1.tar.gz
    bellagio                 libomxil-bellagio-0.9.3.tar.gz
    blackbox                 blackbox-0.70.1.tar.bz2
    boost                    boost_1_56_0.tar.bz2
    bootutils                bootutils-1.0.0.tar.gz
    ccrypt                   ccrypt-1.10.tar.gz
    cegui06                  CEGUI-0.6.2b.tar.gz
    cppcms                   cppcms-1.0.4.tar.bz2
    cramfs                   cramfs-1.1.tar.gz
    curlftpfs                curlftpfs-0.9.2.tar.gz
    dbus-cpp                 libdbus-c++-0.9.0.tar.gz
    dtach                    dtach-0.8.tar.gz
    duma                     duma_2_5_15.tar.gz
    dvbsnoop                 dvbsnoop-1.4.50.tar.gz
    empty                    empty-0.6.19b.tgz
    espeak                   espeak-1.48.04-source.zip
    expat                    expat-2.1.0.tar.gz
    expect                   expect5.45.tar.gz
    ezxml                    ezxml-0.8.6.tar.gz
    fdk-aac                  fdk-aac-0.1.3.tar.gz
    fetchmail                fetchmail-6.3.26.tar.xz
    flex                     flex-2.5.37.tar.gz
    fluxbox                  fluxbox-1.3.5.tar.bz2
    fxload                   fxload-2008_10_13.tar.gz
    genext2fs                genext2fs-1.4.1.tar.gz
    genromfs                 genromfs-0.5.2.tar.gz
    gnu-efi                  gnu-efi_3.0u.orig.tar.gz
    gptfdisk                 gptfdisk-0.8.6.tar.gz
    gqview                   gqview-2.1.5.tar.gz
    gtkperf                  gtkperf_0.40.tar.gz
    gutenprint               gutenprint-5.2.9.tar.bz2
    haserl                   haserl-0.9.33.tar.gz
    hplip                    hplip-3.13.10.tar.gz
    igmpproxy                igmpproxy-0.1.tar.gz
    imlib2                   imlib2-1.4.5.tar.bz2
    iperf                    iperf-2.0.5.tar.gz
    ipmitool                 ipmitool-1.8.14.tar.bz2
    iprutils                 iprutils-2.4.5-src.tgz
    irda-utils               irda-utils-0.9.18.tar.gz
    jamvm                    jamvm-2.0.0.tar.gz
    joe                      joe-3.7.tar.gz
    jpeg-turbo               libjpeg-turbo-1.3.1.tar.gz
    lame                     lame-3.99.5.tar.gz
    lbreakout2               lbreakout2-2.6.4.tar.gz
    lcdproc                  lcdproc-0.5.7.tar.gz
    lcms2                    lcms2-2.5.tar.gz
    lesstif                  lesstif-0.95.2.tar.bz2
    libargtable2             argtable2-13.tar.gz
    libcdaudio               libcdaudio-0.99.12p2.tar.gz
    libcgi                   libcgi-1.0.tar.gz
    libcgroup                libcgroup-0.41.tar.bz2
    libcue                   libcue-1.4.0.tar.bz2
    libdmtx                  libdmtx-0.7.4.tar.gz
    libdnet                  libdnet-1.11.tar.gz
    libexif                  libexif-0.6.21.tar.bz2
    libfuse                  fuse-2.9.3.tar.gz
    libglew                  glew-1.10.0.tgz
    libical                  libical-0.48.tar.gz
    libid3tag                libid3tag-0.15.1b.tar.gz
    libjson                  libjson_7.6.1.zip
    libmad                   libmad-0.15.1b.tar.gz
    libmcrypt                libmcrypt-2.5.8.tar.gz
    libmhash                 mhash-0.9.9.9.tar.bz2
    libmms                   libmms-0.6.2.tar.gz
    libmodplug               libmodplug-0.8.8.5.tar.gz
    libmpeg2                 libmpeg2-0.5.1.tar.gz
    liboauth                 liboauth-1.0.3.tar.gz
    libpfm4                  libpfm-4.3.0.tar.gz
    librsync                 librsync-0.9.7.tar.gz
    libseccomp               libseccomp-2.1.1.tar.gz
    libserial                libserial-0.6.0rc1.tar.gz
    libsysfs                 sysfsutils-2.1.0.tar.gz
    libungif                 libungif-4.1.4.tar.bz2
    libupnp                  libupnp-1.6.19.tar.bz2
    libusb-compat            libusb-compat-0.1.5.tar.bz2
    libusb                   libusb-1.0.19.tar.bz2
    libvncserver             LibVNCServer-0.9.9.tar.gz
    libxmlrpc                xmlrpc-c-1.25.26.tgz
    linknx                   linknx-0.0.1.32.tar.gz
    lmbench                  lmbench-3.0-a9.tgz
    log4cplus                log4cplus-1.1.2.tar.xz
    logsurfer                logsurfer-1.8.tar.gz
    ltp-testsuite            ltp-full-20140115.tar.xz
    ltris                    ltris-1.0.19.tar.gz
    madplay                  madplay-0.15.2b.tar.gz
    mcrypt                   mcrypt-2.6.8.tar.gz
    minidlna                 minidlna-1.1.4.tar.gz
    modplugtools             modplugtools-0.5.3.tar.gz
    msgpack                  msgpack-0.5.4.tar.gz
    msmtp                    msmtp-1.4.32.tar.bz2
    mutt                     mutt-1.5.23.tar.gz
    nanocom                  nanocom.tar.gz
    nbd                      nbd-3.8.tar.xz
    netcat                   netcat-0.7.1.tar.gz
    nfs-utils                nfs-utils-1.2.6.tar.bz2
    ngrep                    ngrep-1.45.tar.bz2
    ocf-linux                ocf-linux-20120127.tar.gz
    odhcploc                 odhcploc-20111021.tar.gz
    opencore-amr             opencore-amr-0.1.3.tar.gz
    openocd                  openocd-0.5.0.tar.bz2
    oprofile                 oprofile-0.9.9.tar.gz
    p910nd                   p910nd-0.97.tar.bz2
    pcmanfm                  pcmanfm-0.3.5.9.tar.gz
    poco                     poco-1.4.6p1-all.tar.gz
    prboom                   prboom-2.5.0.tar.gz
    proxychains-ng           proxychains-4.6.tar.bz2
    psmisc                   psmisc-22.21.tar.gz
    ptpd2                    ptpd-2.3.0.tar.gz
    ptpd                     ptpd-1.1.0.tar.gz
    python-dialog            python2-pythondialog-3.0.1.tar.bz2
    python-id3               id3-py_1.2.tar.gz
    python-numpy             numpy-1.8.0.tar.gz
    python-pyparsing         pyparsing-2.0.2.tar.gz
    qwt                      qwt-6.1.0.tar.bz2
    rpcbind                  rpcbind-0.2.1.tar.bz2
    scons                    scons-2.3.0.tar.gz
    ser2net                  ser2net-2.10.0.tar.gz
    sispmctl                 sispmctl-3.1.tar.gz
    smartmontools            smartmontools-6.3.tar.gz
    sox                      sox-14.4.1.tar.gz
    squashfs                 squashfs4.3.tar.gz
    sshfs                    sshfs-fuse-2.5.tar.gz
    sshpass                  sshpass-1.05.tar.gz
    strace                   strace-4.9.tar.xz
    swig                     swig-2.0.12.tar.gz
    synergy                  synergy-1.3.1.tar.gz
    tclap                    tclap-1.2.1.tar.gz
    tcllib                   tcllib-1.13.tar.bz2
    tinyhttpd                tinyhttpd-0.1.0.tar.gz
    tmux                     tmux-1.9a.tar.gz
    tn5250                   tn5250-0.17.4.tar.gz
    twolame                  twolame-0.3.13.tar.gz
    upx                      upx-3.91-src.tar.bz2
    vde2                     vde2-2.3.2.tar.bz2
    vo-aacenc                vo-aacenc-0.1.3.tar.gz
    vtun                     vtun-3.0.3.tar.gz
    wipe                     wipe-2.3.1.tar.bz2
    x11vnc                   x11vnc-0.9.13.tar.gz
    xmlstarlet               xmlstarlet-1.5.0.tar.gz
    zd1211-firmware          zd1211-firmware-1.4.tar.bz2

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
