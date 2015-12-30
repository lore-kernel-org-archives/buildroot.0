From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 14:54:50 +0100
Subject: [Buildroot] [PATCH] mbedtls: disable assembly for some scenarios
In-Reply-To: <1451477223-14834-1-git-send-email-gustavo@zacarias.com.ar>
References: <1451477223-14834-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151230145450.4e6f8702@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 30 Dec 2015 09:07:03 -0300, Gustavo Zacarias wrote:
> It's affected in the same way as polarssl, but use an enhanced trick
> compared to 130ca81b since it's required by the codebase. Fixes:
> http://autobuild.buildroot.net/results/584/584d1d12be9f2bbf45ccbdf93b6b442524059dcc/
> http://autobuild.buildroot.net/results/d13/d13a06ba3fc0d7f08a03c04fcb484761da7af3f7/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mbedtls/mbedtls.mk | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
