From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 20:10:30 +0200
Subject: [Buildroot] [PATCH] xinetd: Patch configure script to fix
 rlim_t test
In-Reply-To: <1410882141-16213-1-git-send-email-maarten@treewalker.org>
References: <1410882141-16213-1-git-send-email-maarten@treewalker.org>
Message-ID: <20140921201030.0ea3b3de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Tue, 16 Sep 2014 17:42:21 +0200, Maarten ter Huurne wrote:
> Fixes build with musl libc.
> 
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
>  package/xinetd/xinetd-005-configure-rlim_t.patch | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/xinetd/xinetd-005-configure-rlim_t.patch

I've renamed the patch to use the 004 sequence number, which wasn't
used.

Applied, thanks a lot! Please don't forget to submit upstream if it's
not already done.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
