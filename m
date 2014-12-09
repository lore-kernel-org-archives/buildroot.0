From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 20:17:10 +0100
Subject: [Buildroot] [PATCH] thrift: disable tutorial(s)
In-Reply-To: <1418152385-21365-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418152385-21365-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141209201710.3b49c909@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  9 Dec 2014 16:13:05 -0300, Gustavo Zacarias wrote:
> The tutorials don't pass pedantic mode hence causing failures.
> And we don't care about tutorials anyway, disable them to save time as
> well. Fixes.
> http://autobuild.buildroot.net/results/f68/f68d537e623f565000ca966372a7c0277f4e3888/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/thrift/thrift.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
