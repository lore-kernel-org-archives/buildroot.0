From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 20 Nov 2014 21:07:23 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-19
References: <20141120073014.164A510107F@stock.ovh.net>
 <20141120094407.4b487379@free-electrons.com>
Message-ID: <XnsA3EBD6DFC8674berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141120094407.4b487379 at free-electrons.com:

>>          arm |             mesa3d-demos-8.2.0 | NOK | 
http://autobuild.buildroot.net/results/92edf234780795bc2dc1aa495c492df1528204
a1/
> 
> corender.c:17:19: fatal error: GL/gl.h: No such file or directory
> 
> Yann, Bernd? I know Yann did an analysis of the issue, but I don't
> think we heard back from Bernd about it. Bernd, can you have a look at
> Yann's analysis of the issue?

Hi,

actually Peter commented on v1 of my patch to fix this bug ;)
Just sent v2: http://patchwork.ozlabs.org/patch/412860/

Yann commented on my glmark2 patch, not committed to buildroot yet, which 
should depend on mesa3d for the time being.

Regards, Bernd
