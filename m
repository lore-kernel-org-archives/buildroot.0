From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 23:31:31 +0200
Subject: [Buildroot] [PATCH] support/dependencies: check that PATH does
 not contain CWD
In-Reply-To: <20180509175924.10867-1-yann.morin.1998@free.fr>
References: <20180509175924.10867-1-yann.morin.1998@free.fr>
Message-ID: <20180509233131.6747ce52@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 May 2018 19:59:24 +0200, Yann E. MORIN wrote:
> ... and simplify the test code for PATH and LD_LIBRARY_PATH.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/dependencies/dependencies.sh | 59 ++++++++++++++----------------------
>  1 file changed, 23 insertions(+), 36 deletions(-)

This commit log was a bit terse, and didn't give any details about the
specific bug report we had on IRC that lead to this bug fix. So I've
extended the commit log quite a bit, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
