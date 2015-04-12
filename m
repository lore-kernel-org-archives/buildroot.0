From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2015 17:53:05 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-04-10
References: <20150411063020.722671014D2@stock.ovh.net>
Message-ID: <XnsA47AB5EF31171berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150411063020.722671014D2 at stock.ovh.net:

>       x86_64 |          network-manager-1.0.0 | NOK | 
http://autobuild.buildroot.net/results/6fc493e80ec2dc04aa12fd6f6f95f0c6162390
91/

Hi,

in order to fix this bug we need to backport (again ;)) an upstream uclibc
commit: http://git.uclibc.org/uClibc/commit/?
id=a15c934313bfa30a0b341c22e5a88a734d011bf8 

Regards, Bernd
