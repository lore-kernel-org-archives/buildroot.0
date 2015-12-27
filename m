From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 12:14:30 +0100
Subject: [Buildroot] [PATCH 1/2 v5] vboot-utils: new package
In-Reply-To: <20151225214010.GA30096@vostro>
References: <20151225214010.GA30096@vostro>
Message-ID: <20151227121430.2d6920d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Fri, 25 Dec 2015 23:40:10 +0200, Alex Suykov wrote:
> Chromium OS verified boot utilities.
> 
> Needed for signing kernel images and manipulating bootable
> partitions on media intended for Chromebooks.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
> v2: _LICENSE_FILES, minor text fixes
> v3: git snapshot over https instead of git checkout
>     comments on unusual make targets
>     proper license name
> v4: host-pkgconf dependency, proper host CC/CFLAGS/LDFLAGS
> v5: revert to git checkout, ChromiumOS -> Chromium OS

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
