From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:44:22 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/mesa3d: Enable support for
 Radeon r600 gallium driver
In-Reply-To: <1421514235-27122-2-git-send-email-bernd.kuhls@t-online.de>
References: <1421514235-27122-1-git-send-email-bernd.kuhls@t-online.de>
 <1421514235-27122-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150202214422.54d3c4a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 17 Jan 2015 18:03:55 +0100, Bernd Kuhls wrote:
> --
> v2: - rebased patch from micro1183: http://patchwork.ozlabs.org/patch/398858/
>     - removed support for r300 & radeonsi because they need llvm support
>       which is not provided by buildroot

This should be not part of the commit log. And this time around, I
noticed after applying/pushing :-/

Applied anyway, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
