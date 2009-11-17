From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 17 Nov 2009 17:12:53 -0600
Subject: [Buildroot] [PATCH] Add support for the Cortex-A8 processor
Message-ID: <200911171712.55522.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue November 17 2009, Peter Korsgaard wrote:
> 
>  Laine> From 709c9a9140b377112a6721155e2a70bbaa893121 Mon Sep 17 00:00:00 2001
>  Laine> From: Laine Walker-Avina <lwalkera@ieee.org>
>  Laine> Date: Thu, 5 Nov 2009 14:27:45 -0800
>  Laine> Subject: [PATCH] GCC: Add 4.4.2 as the active 4.4.x version
> 
> We already have 4.4.2 support in BR.
> 

Just a FYI - yesterday learned, the hard way (I.E: before reading the release notes):

There was an ABI change from gcc-4.3 to gcc-4.4 for MIPS/MIPSel
There are a lot of things affected, I gave up on that and switched back to 4.3.whatever

Mike
