From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Apr 2018 22:50:45 +0200
Subject: [Buildroot] [PATCH] support/scripts: drop xorg-release script
In-Reply-To: <20180425192402.12995-1-thomas.petazzoni@bootlin.com>
References: <20180425192402.12995-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180427225045.68c9983c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Apr 2018 21:24:02 +0200, Thomas Petazzoni wrote:
> This script causes a large number of flake8 warnings, is rarely used
> (but even never used), and is going to be replaced at some point by
> the improved pkg-stats that will give details about the upstream
> version available for all packages, not just X.org packages.
> 
> Therefore, let's drop the xorg-release script in order to silence all
> those flake8 warnings:
> 
> support/scripts/xorg-release:36:1: E302 expected 2 blank lines, found 1
> support/scripts/xorg-release:58:27: E201 whitespace after '{'
> support/scripts/xorg-release:58:44: E203 whitespace before ':'
> support/scripts/xorg-release:58:54: E202 whitespace before '}'
> support/scripts/xorg-release:63:1: E305 expected 2 blank lines after class or function definition, found 1
> support/scripts/xorg-release:64:15: E261 at least two spaces before inline comment
> support/scripts/xorg-release:67:32: E261 at least two spaces before inline comment
> support/scripts/xorg-release:86:1: E302 expected 2 blank lines, found 1
> support/scripts/xorg-release:95:1: E302 expected 2 blank lines, found 1
> support/scripts/xorg-release:107:1: E302 expected 2 blank lines, found 1
> support/scripts/xorg-release:115:20: W601 .has_key() is deprecated, use 'in'
> support/scripts/xorg-release:123:34: E201 whitespace after '{'
> support/scripts/xorg-release:124:46: E203 whitespace before ':'
> support/scripts/xorg-release:124:50: E202 whitespace before '}'
> support/scripts/xorg-release:127:1: E302 expected 2 blank lines, found 1
> support/scripts/xorg-release:141:15: W601 .has_key() is deprecated, use 'in'
> support/scripts/xorg-release:146:21: W601 .has_key() is deprecated, use 'in'
> support/scripts/xorg-release:176:1: E305 expected 2 blank lines after class or function definition, found 1
> support/scripts/xorg-release:180:1: W391 blank line at end of file
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/xorg-release | 180 -------------------------------------------
>  1 file changed, 180 deletions(-)
>  delete mode 100755 support/scripts/xorg-release

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
