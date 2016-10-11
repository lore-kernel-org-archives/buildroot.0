From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2016 12:16:25 +0200
Subject: [Buildroot] [PATCH] webkitgtk: add upstream patch for failed
 gcc6 builds
In-Reply-To: <1476133392-11842-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476133392-11842-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161011121625.0b595c92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Oct 2016 18:03:12 -0300, Gustavo Zacarias wrote:

> diff --git a/package/webkitgtk/0001-fix-gcc6-builds.patch b/package/webkitgtk/0001-fix-gcc6-builds.patch
> new file mode 100644
> index 0000000..83e038a
> --- /dev/null
> +++ b/package/webkitgtk/0001-fix-gcc6-builds.patch
> @@ -0,0 +1,40 @@
> +Upstream, from: https://trac.webkit.org/changeset/205672
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

This description is a bit short, so I copy/pasted the description of
the upstream patch here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
