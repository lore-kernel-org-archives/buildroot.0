From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 09:47:53 +0200
Subject: [Buildroot] [PATCH 1/1] lzop: fix for compiling host-lzop using
 gcc-6
In-Reply-To: <20160616054744.4092-1-jaap@jcz.nl>
References: <20160616054744.4092-1-jaap@jcz.nl>
Message-ID: <20160616094753.1a8d0ed8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 07:47:44 +0200, Jaap Crezee wrote:

> diff --git a/package/lzop/001-host-gcc-6.patch b/package/lzop/001-host-gcc-6.patch
> new file mode 100644
> index 0000000..852debe
> --- /dev/null
> +++ b/package/lzop/001-host-gcc-6.patch

Thanks for this new version, but there is still no description and
Signed-off-by in the patch itself. Look at all patches in
package/*/*.patch for the proper format.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
