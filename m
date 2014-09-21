From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 20:04:02 +0200
Subject: [Buildroot] [PATCH] musl: Add post-1.1.4 commit to provide
 max_align_t
In-Reply-To: <1410487649-1365-1-git-send-email-maarten@treewalker.org>
References: <1410487649-1365-1-git-send-email-maarten@treewalker.org>
Message-ID: <20140921200402.061caf87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Fri, 12 Sep 2014 04:07:29 +0200, Maarten ter Huurne wrote:
> Without this, including libstdc++'s <cstddef> fails.
> 
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
>  package/musl/musl-0001-add-max_align_t.patch | 153 +++++++++++++++++++++++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 package/musl/musl-0001-add-max_align_t.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
