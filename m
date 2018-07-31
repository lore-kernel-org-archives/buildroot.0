From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 21:43:15 +0200
Subject: [Buildroot] [PATCH v2 1/3] libglib2: backport upstream patch to
 handle missing fcntl() flags
In-Reply-To: <20180730220218.26454-1-hollis_blanchard@mentor.com>
References: <20180730220218.26454-1-hollis_blanchard@mentor.com>
Message-ID: <20180731214315.4542df50@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Jul 2018 15:02:16 -0700, Hollis Blanchard wrote:
> On RHEL6 hosts, fcntl.h doesn't define F_SETPIPE_SZ or F_GETPIPE_SZ. Upstream
> glib has a patch for this case that wasn't applied to their 2.56.1 branch.
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> ---
>  ...-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch

Applied to master after adding a reference to the autobuilder failure
being fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
