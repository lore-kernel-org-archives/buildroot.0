From: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
Date: Mon, 22 Apr 2013 10:07:22 +0200
Subject: [Buildroot] xenomai: bump to version 2.6.2.1
Message-ID: <1366618043-21067-1-git-send-email-victor.hiairrassary.ml@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello all,

Acording to the commit message, the associated patch:
- bumps to version 2.6.2.1

- removes BR2_PACKAGE_XENOMAI_SMP since xenomai 2.6.2 no more
requires to pass the --enable-smp option : see release notes at
http://www.xenomai.org/index.php/Xenomai:News#2012-12-26_Xenomai_2.6.2

- removes xenomai-thumb-fix.patch since it was completely merged
in xenomai 2.6.2

I have tested it on my armadeus apf27.

Best regards,
Victor Hiairrassary
