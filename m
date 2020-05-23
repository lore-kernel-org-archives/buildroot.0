From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 23 May 2020 09:43:39 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-05-22
In-Reply-To: <20200523062656.A111E8693D@whitealder.osuosl.org>
References: <20200523062656.A111E8693D@whitealder.osuosl.org>
Message-ID: <CAEyMn7bhK51BMDpB4o4PcAEcyjStf93P+LrfQgjkdWkcAGGabA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Am Sa., 23. Mai 2020 um 08:27 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> Autobuild statistics for 2020-05-22
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>   2020.02.x  |  9  |  8  |  0  | 17  |
>     master   | 81  | 43  |  0  | 124 |
>      next    |  5  |  6  |  0  | 11  |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>              host-gnupg-1.4.23 | 7

I tried to backport an upstream available fix but the patch does not
apply on the version in the buildroot package.

>               host-audit-2.8.5 | 4

Backported upstream patch to fix gcc10 issue:
http://lists.busybox.net/pipermail/buildroot/2020-May/283077.html

>               ibm-sw-tpm2-1563 | 3
>                 qt5base-5.14.2 | 3
>                  gnutls-3.6.13 | 2
>              host-elixir-1.9.4 | 2
>               host-erlang-22.2 | 2

Backported upstream patch to fix gcc10 issue:
http://lists.busybox.net/pipermail/buildroot/2020-May/283055.html

>                libtheora-1.1.1 | 2
>            libusb-compat-0.1.7 | 2
>                     mpv-0.29.1 | 2
>                   assimp-5.0.1 | 1
>                     brltty-6.1 | 1
>                 coreutils-8.32 | 1
>           host-acpica-20191018 | 1
>                host-efl-1.22.3 | 1

Backported upstream patch to fix gcc10 issue:
http://lists.busybox.net/pipermail/buildroot/2020-May/283055.html

But the version bump to 1.24.0 has this patch already included.
http://lists.busybox.net/pipermail/buildroot/2020-May/282035.html

>               host-grpc-1.25.0 | 1
>                    libnss-3.52 | 1
> lrzip-8781292dd5833c04eeead... | 1
>                  mesa3d-20.0.7 | 1
>          python-gobject-3.36.0 | 1
>          qt5declarative-5.14.2 | 1
>                 suricata-4.1.8 | 1
>                        unknown | 1
>                  xvisor-0.2.11 | 1
>

-- 
Heiko
