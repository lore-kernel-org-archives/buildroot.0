From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 08:34:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/lirc-tools: fix musl build
In-Reply-To: <1454192444-26265-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454192444-26265-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131083444.1392f35f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 23:20:44 +0100, Bernd Kuhls wrote:
> Inspired by
> https://bug.tasktools.org/secure/attachment/10271/0001-Fix-build-with-musl-libc.patch
> 
> Fixes
> http://autobuild.buildroot.net/results/603/603c4426c47220808305a416f3d60fec2d8c02a3/
> http://autobuild.buildroot.net/results/c08/c08abddeb5f0d0d1adec63ab4390562e3cfe1087/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/lirc-tools/0004-musl.patch | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 package/lirc-tools/0004-musl.patch
> 
> diff --git a/package/lirc-tools/0004-musl.patch b/package/lirc-tools/0004-musl.patch
> new file mode 100644
> index 0000000..e5eddba
> --- /dev/null
> +++ b/package/lirc-tools/0004-musl.patch
> @@ -0,0 +1,19 @@
> +Fix musl build
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Existing patches on lirc are Git formatted, and the upstream project
uses a Git repository, so please generate Git formatted patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
