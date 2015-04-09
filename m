From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 09 Apr 2015 12:33:49 +0200
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <XnsA4777FCDAF5A6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo Zacarias <gustavo@zacarias.com.ar> wrote in 
news:1425588249-20942-2-git-send-email-gustavo at zacarias.com.ar:

> +     depends on BR2_TOOLCHAIN_USES_GLIBC # needs nss.h, $ORIGIN support

Hi,

is this really necessary? Building samba4 with uclibc worked here and I guess 
the problem you saw with nss.h was fixed in 4.2.0rc3:
https://bugzilla.samba.org/show_bug.cgi?id=11026

Please note that I tested compilation only, for a runtime test I need more 
time.

Regards, Bernd
