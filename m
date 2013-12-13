From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Dec 2013 09:29:46 +0100
Subject: [Buildroot] [PATCH v2 1/2] xl2tp: add licensing info
In-Reply-To: <1386896468.9372.1.camel@phoenix> (Axel Lin's message of "Fri, 13
 Dec 2013 09:01:08 +0800")
References: <1386896468.9372.1.camel@phoenix>
Message-ID: <87ppp1ywzp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 > Signed-off-by: Axel Lin <axel.lin@ingics.com>
 > ---
 > v2: no change, just make version consistent in this serial
 > I separate "xl2tp: bump to version 1.3.2 and add licensing info" to 2 patches.
 > This one adds licensing info, next patch for bump version.
 >  package/xl2tp/xl2tp.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
 > index cf496fe..07634a0 100644
 > --- a/package/xl2tp/xl2tp.mk
 > +++ b/package/xl2tp/xl2tp.mk
 > @@ -7,6 +7,8 @@
 >  XL2TP_VERSION = v1.3.1
 >  XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
 >  XL2TP_DEPENDENCIES = libpcap
 > +XL2TP_LICENSE = GPLv2+
 > +XL2TP_LICENSE_FILES = LICENSE

The only hit for 'any later' is in the Makefile and it seems to contain
headers from the Linux kernel. The spec files list 'GPLv2' so I think
it's safer to call it GPLv2 only.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
