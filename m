From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 00:34:17 +0200
Subject: [Buildroot] [PATCH] gmp: dissable assembly for armv7m
In-Reply-To: <1466431203-11803-1-git-send-email-gustavo@zacarias.com.ar>
References: <1466431203-11803-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160704003417.74f0e1a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Jun 2016 11:00:03 -0300, Gustavo Zacarias wrote:
> It has different assembly constraints which can't be satisfied. Fixes:
> http://autobuild.buildroot.net/results/ac6/ac65384a325912788790ceafa7db657cef9382fa/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gmp/gmp.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
