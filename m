From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 24 Jun 2010 12:47:03 +0200
Subject: [Buildroot] nbd fails to compile with /usr/bin/klcc: unknown
	option: --sysroot=
In-Reply-To: <20100624094417.37048649@surf>
References: <201006240053.12651.PeterHuewe@gmx.de>
	<20100624094417.37048649@surf>
Message-ID: <201006241247.03936.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Donnerstag 24 Juni 2010 09:44:17 schrieb Thomas Petazzoni:
>  *) Update to nbd 2.9.15 (the current version in Buildroot is 2.9.11),
>     which has removed support for klcc.
> 
> In any case, don't forget to send a patch ! :-)

Created a patch and sent it to the mailing list - compiles fine. :)
Thanks for the hint.

Peter
