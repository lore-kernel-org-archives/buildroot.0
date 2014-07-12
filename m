From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jul 2014 20:48:20 +0200
Subject: [Buildroot] [PATCH] libgpgme: disable all tests
In-Reply-To: <1405170481-18028-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405170481-18028-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140712204820.42cb408c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 12 Jul 2014 10:08:01 -0300, Gustavo Zacarias wrote:
> Disable all of the tests, including runtime that needs gnupg.
> There's no longer --without configure options for them, it's now
> --disable. Fixes:
> http://autobuild.buildroot.net/results/eb1/eb1e06b1d99c441b6086c07ee04b084a61041dc7/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libgpgme/libgpgme.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
