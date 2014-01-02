From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 22:21:29 +0100
Subject: [Buildroot] [PATCH 4/4] transmission: Fix build error
 "conflicting types for 'UTP_Write'" after version bump
In-Reply-To: <BLU0-SMTP287B7593393BF8A5143ED5FD9CB0@phx.gbl>
References: <BLU0-SMTP287B7593393BF8A5143ED5FD9CB0@phx.gbl>
Message-ID: <20140102222129.3f5eba3d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 2 Jan 2014 20:28:49 +0100, Bernd Kuhls wrote:
> fix taken from http://www.adminsehow.com/2012/10/how-to-install-transmission-2-71-on-debian-6-0-squeeze/
> 
> compile tested on arch sh4, fixes
> http://autobuild.buildroot.org/results/638/63884de929fb7339ebf44b08cb5d1ab30010666a/
> 
> should also fix powerpc
> http://autobuild.buildroot.org/results/eb4/eb486228a11a9602d4bf40e771744d2b2b40508f/
> 
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> ---
>  package/transmission/transmission-fix-utypes.patch |   22 ++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 package/transmission/transmission-fix-utypes.patch
> 
> diff --git a/package/transmission/transmission-fix-utypes.patch b/package/transmission/transmission-fix-utypes.patch
> new file mode 100644
> index 0000000..74f3d32
> --- /dev/null
> +++ b/package/transmission/transmission-fix-utypes.patch

Thanks, but please add a description + Signed-off-by inside the patch
itself. It should also point to where you found the patch.

See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
