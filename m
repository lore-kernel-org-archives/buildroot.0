From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 27 Jan 2015 12:21:31 +0100
Subject: [Buildroot] [PATCH] openssl: bump version to 1.0.2
In-Reply-To: <87r3uhyz00.fsf@dell.be.48ers.dk>
References: <1422296409-48296-1-git-send-email-Vincent.Riera@imgtec.com>
 <87r3uhyz00.fsf@dell.be.48ers.dk>
Message-ID: <54C774BB.7010207@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

yes, I have built some packages depending on openssl. See this 
build-time.log list:

$ awk -F: '{print $4}' build-time.log | uniq
  toolchain-external
  toolchain
  busybox
  dtv-scan-tables
  host-m4
  host-libtool
  host-autoconf
  host-automake
  host-pkgconf
  zlib
  openssl
  host-ncurses
  ncurses
  readline
  lftp
  host-libcap
  libcap
  libcurl
  libevent
  libffi
  libsigc
  libtorrent
  lzo
  nut
  openssh
  host-expat
  host-zlib
  host-python
  python
  rtorrent
  squid
  stunnel
  host-gettext
  host-libxml-parser-perl
  host-intltool
  transmission
  tvheadend
  vsftpd
  host-bison
  host-flex
  vtun
  wget
  wpa_supplicant
  host-fakeroot
  host-makedevs
  host-mkpasswd

Regards,
--
Vincent

El 26/01/15 a las 23:10, Peter Korsgaard escribi?:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>
>   > - Bump version to 1.0.2
>   > - Adapt patches to new version
>   > - Update hash value
>
> 1.0.2 is listed as a new major version. Is it 100% compatible? Did you
> test build some packages?
>
