From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Oct 2014 23:48:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/openssl: drop libdl from more
	pc files
References: <1411835343-32736-1-git-send-email-bernd.kuhls@t-online.de>
 <20141029234038.7f3d1c11@free-electrons.com>
Message-ID: <XnsA3D5F242B1BDFberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141029234038.7f3d1c11 at free-electrons.com:

> Is this patch still needed? According to
> http://autobuild.buildroot.org/?reason=libcurl-7.37.1, the problem
> doesn't seem to have appeared since September, 2nd.

Hi,

we are at 7.38.0 now ;) and the error is still reported by the autobuilders:
http://autobuild.buildroot.net/?reason=libcurl-7.38.0

I will try to reproduce the bug using your defconfig in the near future.

Regards, Bernd
