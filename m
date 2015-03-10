From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 Mar 2015 20:29:14 +0100
Subject: [Buildroot] [PATCH 2/2] package/softether: bump version
References: <1426013917-11263-1-git-send-email-bernd.kuhls@t-online.de>
 <1426013917-11263-2-git-send-email-bernd.kuhls@t-online.de>
 <87h9tspt73.fsf@dell.be.48ers.dk>
Message-ID: <XnsA459D0685E7F3berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <peter@korsgaard.com> wrote in 
news:87h9tspt73.fsf at dell.be.48ers.dk:

> > -SOFTETHER_VERSION = 16b713b98da8dba29f0f845d5a8c36d6f7c34824
> > +SOFTETHER_VERSION = 64fd19e6f849247e3daee765ad278c6bf072afcb
> 
> Does this include the patch in 1/2? If so then we should drop that patch
> (and if not, why not?)

Hi,

no, the clock_gettime patch (http://patchwork.ozlabs.org/patch/448671/) has 
not yet made it into upstream.

Regards, Bernd
