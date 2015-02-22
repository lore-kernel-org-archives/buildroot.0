From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 12:13:05 +0100
Subject: [Buildroot] [PATCH 0/11 v5] weston: new freerdp backend (branch
 yem/freerdp)
In-Reply-To: <cover.1424558036.git.yann.morin.1998@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
Message-ID: <20150222121305.6ca281ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 21 Feb 2015 23:36:19 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (11):
>       package/freerdp: bump version
>       package/freerdp: conditionally build gstreamer support
>       package/freerdp: conditionally build support for libXi
>       package/freerdp: conditionally build support for libXrender
>       package/freerdp: avoid development warning
>       package/freerdp: do not forcibly depend on X.Org
>       package/freerdp: move architecture-specific block
>       package/freerdp: add options to enable/disable server and/or client
>       package/freerdp: also install to staging
>       package/freerdp: install server key and certificate

All applied to next. I have a few questions on some of them, I'll reply
to the individual e-mails.

>       package/weston: add support for the RDP compositor

This one I believe has a real issue, I'll reply to it specifically.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
