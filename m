From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 10:16:58 +0200
Subject: [Buildroot] [PATCH v2 36/37] utils/checkpackagelib: exclude
 four files from Config.in indentation check
In-Reply-To: <20180401050850.5701-37-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-37-ricardo.martincoski@gmail.com>
Message-ID: <20180401101658.741292b1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:49 -0300, Ricardo Martincoski wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> package/Config.in, package/Config.in.host, package/x11r7/Config.in and
> package/kodi/Config.in do not comply with the normal Config.in
> indentation rules. However, this violation of the rule is legitimate, so
> let's skip them in check-package for this specific indentation check.
> 
> This removes the last 2197 remaining warnings on Config.in files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [Ricardo: rebase patch to use relative paths passed by the main script,
>           fix flake8 warnings, add package/Config.* to the list]
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> NOTE: this patch depends on the first one that introduces the use of
> relative paths by the main script when testing intree files.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
