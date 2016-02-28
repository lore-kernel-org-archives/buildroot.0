From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 23:08:21 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: fix big endian build
In-Reply-To: <1456489054-10492-1-git-send-email-john@keeping.me.uk>
References: <1456489054-10492-1-git-send-email-john@keeping.me.uk>
Message-ID: <20160228230821.47820f15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Keeping,

On Fri, 26 Feb 2016 12:17:34 +0000, John Keeping wrote:
> From: John Keeping <john@metanate.com>
> 
> This patch has been accepted upstream and requires no changes to apply
> to 5.37.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
> I'm not sure whether an S-o-b should be applied to the patch in this
> commit; the upstream bluez project does not accept patches with an S-o-b
> and the patch included here is the unmodified output of:

I've applied to master, with the following changes:

    [Thomas:
     - add reference to upstream commit
     - add John's SoB to the patch itself
     - add reference to autobuilder failure.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
