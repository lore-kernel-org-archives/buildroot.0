From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:46:29 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
In-Reply-To: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <20161217154629.09d3f0e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Dec 2016 15:59:24 +0100, Andreas Naumann wrote:

> Andreas Naumann (4):
>   qt5: Remove all hashes
>   qt5: bump to 5.8.0-rc
>   qt5declarative: enable Quick for non-GL platforms
>   qt5quickcontrols1/2: enable for software renderer
> 
> Julien Corjon (3):
>   qt5enginio : move into legacy compatibility
>   qt53d/qt5quickcontrols2/qt5serialbus : move out of tech preview
>   Revert "qt5base: install bundled fonts to target"

I've marked the set of patches as "Changes Requested" in our patch
tracking system. Can you resubmit when a "fixed" -rc release of Qt 5.8
is published?

Also, you had a few comments during the review, if you could take them
into account, it would be nice.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
