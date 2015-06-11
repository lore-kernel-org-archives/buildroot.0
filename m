From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jun 2015 22:12:45 +0200
Subject: [Buildroot] [PATCH v2 1/3] support: update Kconfiglib to the
 latest version
In-Reply-To: <1433943625-17606-1-git-send-email-ulfalizer@gmail.com>
References: <1433943625-17606-1-git-send-email-ulfalizer@gmail.com>
Message-ID: <20150611221245.792dd1cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ulf Magnusson,

On Wed, 10 Jun 2015 15:40:25 +0200, Ulf Magnusson wrote:
> Corresponds to a95f477 in https://github.com/ulfalizer/Kconfiglib.
> 
> Fixes:
> 
>  - Unset user values when loading a zero-byte .config. (5e54e2c)
> 
>  - Ignore indented .config assignments. (f8a7510)
> 
>  - Do not require $srctree to be set for non-kernel projects. (d56e9c1)
> 
>  - Allow digits in $-references to symbols. (ecacdd5)
> 
>  - Add Symbol.is_allnoconfig_y(). (deaa624)
> 
>  - Fix small output issue with Comments inside Choices.
> 
> Also adds Python 3 support and has a lot of internal cleanup and
> optimization.
> 
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  support/scripts/kconfiglib.py     | 2225 +++++++++++++++++--------------------
>  support/scripts/readme.kconfiglib |    2 +-
>  2 files changed, 998 insertions(+), 1229 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
