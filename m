From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 07:21:57 +0200
Subject: [Buildroot] [PATCH v2 2/2] configs: add defconfig for TS-4900
In-Reply-To: <017033a8-afa4-5b74-3d69-99b2bcefbbb9@mind.be>
References: <1474143804-19181-1-git-send-email-mathieu.audat@savoirfairelinux.com>
 <1474143804-19181-3-git-send-email-mathieu.audat@savoirfairelinux.com>
 <20160918171032.2ee45abd@free-electrons.com>
 <017033a8-afa4-5b74-3d69-99b2bcefbbb9@mind.be>
Message-ID: <20160922072157.547f1747@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 22:35:35 +0200, Arnout Vandecappelle wrote:

>  As discussed in v1 of this patch, the problem is that this is a defconfig for a
> module. Several hardware revisions of this module exist with different DDR
> chips, which require a different U-Boot config. So we'd need several buildroot
> defconfigs for the different module revisions. And it's not easy to distinguish
> between them.
> 
>  In addition, recovery through USB requires a specific baseboard that sets the
> boot mode pins in a way that you actually boot from USB. Not everybody necessary
> has this baseboard.
> 
>  For these reasons, I agreed with Mathieu that it was OK to skip the bootloader.

OK, fine with me. Thanks for the explanation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
