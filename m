From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:38:27 +0200
Subject: [Buildroot] [PATCH 1/1] host-lzop host-gcc 6 fix
In-Reply-To: <20160611103859.31752-1-jaap@jcz.nl>
References: <20160611103859.31752-1-jaap@jcz.nl>
Message-ID: <20160611163827.00de052c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Jun 2016 12:38:59 +0200, Jaap Crezee wrote:
> Signed-off-by: Jaap Crezee <jaap@jcz.nl>

The commit title must always have the form:

	<package>: <description>

> ---
>  package/lzop/001-host-gcc-6.patch | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/lzop/001-host-gcc-6.patch
> 
> diff --git a/package/lzop/001-host-gcc-6.patch b/package/lzop/001-host-gcc-6.patch
> new file mode 100644
> index 0000000..852debe
> --- /dev/null
> +++ b/package/lzop/001-host-gcc-6.patch
> @@ -0,0 +1,26 @@

All patches must have a description + Signed-off-by. 

Could you rework your patch to fix those issues?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
