From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Aug 2016 23:48:30 +0200
Subject: [Buildroot] [PATCH] netplug: add two patches to fix musl build
 issues
In-Reply-To: <1470430356-29349-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470430356-29349-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160808234830.07be4951@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Aug 2016 22:52:36 +0200, Thomas Petazzoni wrote:
> This commit adds two patches to netplug that are needed for this package
> to build with musl:
> 
>  - One patch to add a missing header inclusion
>  - One patch to fix a conflicting prototype on __assert_fail().
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c2a5dfedba46cc8eb3d0c5c43f1f76fe0bb1805f/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../netplug/0002-add-missing-time-include.patch    | 20 +++++++++
>  package/netplug/0003-remove-assert-fail.patch      | 51 ++++++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 package/netplug/0002-add-missing-time-include.patch
>  create mode 100644 package/netplug/0003-remove-assert-fail.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
