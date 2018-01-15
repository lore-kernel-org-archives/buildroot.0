From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 20:57:34 +0100
Subject: [Buildroot] [PATCH v2 2/2] open-lldp: new package
In-Reply-To: <20180115162122.32108-2-laurent_pubs@yahoo.com>
References: <20180115162122.32108-1-laurent_pubs@yahoo.com>
 <20180115162122.32108-2-laurent_pubs@yahoo.com>
Message-ID: <20180115205734.2dbd0afd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration, things are getting better!

On Mon, 15 Jan 2018 17:21:22 +0100, Laurent Charpentier wrote:
> - Removed call to bootstrap.sh. However the m4 directory needs to be created for autoconf.
> - Added hash for COPYING.
> - Fixed gcc compile errors (inline functions).
> 
> Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>

You shouldn't have two patches, but just one. Please use "git rebase
-i" to squash your two patches into one.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
