From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:44:56 +0200
Subject: [Buildroot] [PATCH 4/4] policycoreutils: add option to build
 audit2allow
In-Reply-To: <20170202224505.22882-4-Adamduskett@outlook.com>
References: <20170202224505.22882-1-Adamduskett@outlook.com>
 <20170202224505.22882-4-Adamduskett@outlook.com>
Message-ID: <20170409154456.0136f2d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Feb 2017 17:45:05 -0500, Adam Duskett wrote:
> This python utility scans the logs for messages logged when the system
> denied permission for operations, and  generates  a snippet of policy
> rules which, if loaded into policy, might have allowed  those operations
> to succeed.  However, this utility only generates Type Enforcement (TE)
> allow rules.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

Applied to master with the following changes:

    [Thomas: adjust Config.in to propagate the dependencies of sepolgen,
    checkpolicy and python3.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
