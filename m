From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 22 Sep 2007 20:03:05 +0200
Subject: [Buildroot] Creating x86 bootable ISO
In-Reply-To: <2D30722FBBDE6749973243F4F01BE984C6599A@dotexchange.dotcorporation.com>
References: <2D30722FBBDE6749973243F4F01BE984C6599A@dotexchange.dotcorporation.com>
Message-ID: <20070922180305.GZ20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2007 at 12:16:50PM -0700, Kay McCormick wrote:
>Hi everyone,
>
> 
>
>I've attempted to create a bootable linux ISO containing my buildroot
>environment.
>
>Thus far I have been unable to do so.  It seems to build and boot from
>the ISO, but it can't find the root.  Any tips for this?  I know I'm not
>providing a lot of information, I will try it again to see if I can be
>more detailed.  Right now I'm just hoping for some generalized "tips"
>from someone who has been through this experience.

see docs/README
and configure your kernel accordingly to include the proper filesystems
(or build an initramfs that loads the desired filesystems).

HTH,
