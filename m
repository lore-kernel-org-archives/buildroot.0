From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:06:42 +0100
Subject: [Buildroot] [PATCH v2] boot/syslinux: bump version to 6.03
In-Reply-To: <1425418387-3117-1-git-send-email-romain.naour@openwide.fr>
References: <1425418387-3117-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150304230642.68d209d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue,  3 Mar 2015 22:33:07 +0100, Romain Naour wrote:
> Since 6.03 syslinux release, the gnu-efi sources are bundled whith
> syslinux. We need to force the build system to use the Buildroot's
> gnu-efi package.
> 
> Remove the patch for find-gnu-efi.sh script which was removed
> and SYSROOT in BUILD_CMDS.
> 
> There are still some parallel build issues, so MAKE1 can't
> be removed for now.
> 
> Add a hash file.
> 
> Fix indentation.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Applied after doing minor tweaks in the new comment you added in
the .mk file (use -> uses, it's -> its, Syslinux -> syslinux).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
