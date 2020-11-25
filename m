From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 25 Nov 2020 22:05:32 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-11-24
References: <20201125081101.01F1B86D31@whitealder.osuosl.org>
Message-ID: <sht29hx9uj.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Wed, 25 Nov 2020 08:10:54 +0000 schrieb Thomas Petazzoni:

>     arm      |        fstrcmp-0.7.D001        | NOK |
>     http://autobuild.buildroot.net/results/
7366d1dd84107956113fc263ba1d715d79acd1ae

caused by https://gcc.gnu.org/bugzilla/show_bug.cgi?id=31798

Shall I disable fstrcmp for static-musl builds?
http://autobuild.buildroot.net/?reason=fstrcmp-0.7.D001

Regards, Bernd
