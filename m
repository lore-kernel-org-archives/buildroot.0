From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 12:43:14 +0200
Subject: [Buildroot] [PATCH] core: add rule to dump packages' build order
In-Reply-To: <fd9c07fd-2e86-ed73-2fd1-bfcf27522664@mind.be>
References: <20170402130338.12542-1-yann.morin.1998@free.fr>
 <39bc6b12-1dfd-8ada-f1bc-8597c6872a1c@mind.be>
 <20170404185928.GA3828@scaer>
 <fd9c07fd-2e86-ed73-2fd1-bfcf27522664@mind.be>
Message-ID: <20170407124314.660c3edc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Apr 2017 12:30:46 +0200, Arnout Vandecappelle wrote:

> > Well, I've been tracking build-order issues for a while last WE, and
> > believe me, I was very happy to be able to see the build order before
> > I attempted a build, yes.  
> 
>  That's my biggest problem with this feature: I have no idea how to use it.
> Could you add some explanation somewhere?

Yann was tracking down the dc3dd failure. With some configurations it
was building, with others not. So he was trying to figure which package
that gets built before dc3dd causes the problem. For this, it was
really nice to be able to load a configuration, and immediately see in
which order packages would be built, and therefore which packages would
be built before dc3dd, without having to do the build itself.

Does that explain better the use case for this?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
