From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:36:58 +0200
Subject: [Buildroot] [PATCH/2017.02.x 1/2] dbus: bump version to 1.10.22
In-Reply-To: <20170815214537.52eb3814@windsurf>
References: <1502372823-31706-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20170814224427.2adfb1c3@windsurf>
 <188886FC-9E87-4A0B-B1EE-D7704B4F979C@armadeus.com>
 <20170815214537.52eb3814@windsurf>
Message-ID: <20170821233658.4541ee99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Aug 2017 21:45:37 +0200, Thomas Petazzoni wrote:

> On Tue, 15 Aug 2017 21:01:51 +0200, S?bastien Szymanski wrote:
> 
> > No particular reason, I just thought it would be easier to backport
> > the dbus patch on the version 1.10.22 as it is applied on this
> > version on the master branch, rather than backporting it on dbus
> > version 1.10.16.  
> 
> To change things in a LTS branch such as 2017.02.x, we need a much more
> solid reason than just "no particular reason".
> 
> So I think we need a backport of the dbus patch working around the
> expat related issues on top of 1.10.16, instead of bumping dbus to
> 1.10.22.

Following this discussion, I have marked your two patches as Changes
Requested in patchwork. Please respin an updated version that takes
into account the comment if you want such patches to be merged.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
