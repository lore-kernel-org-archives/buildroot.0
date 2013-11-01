From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 15:32:57 +0100
Subject: [Buildroot] [PATCH] Config.in files: add/update comments on
 (e)glibc dependencies
In-Reply-To: <83487abb960115929a63.1383220959@argentina>
References: <83487abb960115929a63.1383220959@argentina>
Message-ID: <20131101153257.1fcdb11b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 31 Oct 2013 13:02:39 +0100, Thomas De Schampheleire wrote:
> This patch adds missing comments about (e)glibc dependencies and updates the
> text of existing comments.
> 
> Additionally, it splits dependency expressions for the touched packages from
>   depends on BR2_BASE_DEP && !BR2_TOOLCHAIN_USES_GLIBC
> to
>   depends on BR2_BASE_DEP
>   depends on !BR2_TOOLCHAIN_USES_GLIBC
> so that (positive) base dependencies are separate from the (negative)
> toolchain dependencies. This strategy makes it easier to write such comments
> (because one can simply copy the base dependency from the actual package
> config option), but also avoids complex and long boolean expressions.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Applied to for-peter-2013.11, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
