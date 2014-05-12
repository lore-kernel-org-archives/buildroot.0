From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 12 May 2014 22:16:08 +0200
Subject: [Buildroot] [PATCH v6 01/32] xproto_dri3proto: New package
References: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
 <1399716164-6452-2-git-send-email-bernd.kuhls@t-online.de>
 <20140512195358.58b15414@free-electrons.com>
 <sme74bxen4.ln2@ID-313208.user.individual.net>
 <20140512213834.52724817@free-electrons.com>
Message-ID: <8pm74bx9op.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140512213834.52724817 at free-electrons.com:

> Well, since the package is autoreconf'ed, then maybe those macros from
> xutil_util-macros are needed?

Hi,

xproto_dri3proto does not use autoreconf, I sent an updated patch:
http://patchwork.ozlabs.org/patch/348099/

The updated package is detected by mesa3d:
checking for DRI3PROTO... yes

Regards, Bernd
