From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 09 Aug 2015 22:32:11 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-08-07
References: <20150808063018.735131014E7@stock.ovh.net>
 <20150809000631.487d0954@free-electrons.com>
Message-ID: <bvpk9cxek9.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 09 Aug 2015 00:06:31 +0200 schrieb Thomas Petazzoni:

>>          arm |                  mesa3d-10.6.3 | NOK |
>>          http://autobuild.buildroot.net/
results/5eef099e82e7a65d9b459d88fcb82b468ccf8fed/
> 
> Bernd, can you confirm that doing a pure static build of mesa3d is not
> supported? Or is it only in some cases?

Hi Thomas,

I am not an expert when it comes to static-only stuff, in fact I never 
used a static-only system ;) Also I fail to see why we should support a 
static-only mesa3d library, DRI drivers need dynamic linking anyway.

Therefore I fixed the autobuilder errors by disabling static support: 
http://patchwork.ozlabs.org/patch/505447/

Regards, Bernd
