From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 20:08:29 +0200
Subject: [Buildroot] [PATCH] juno: adding CMA to linux-juno-defconfig
In-Reply-To: <397c3db00cb2d5d6c3a57b5ba514e7180518e095.1464173670.git.jpinto@synopsys.com>
References: <397c3db00cb2d5d6c3a57b5ba514e7180518e095.1464173670.git.jpinto@synopsys.com>
Message-ID: <20160603200829.173f8b00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 May 2016 11:56:58 +0100, Joao Pinto wrote:
> This patch adds CMA to the juno's default kernel config that is in 
> board/arm/juno. This is critical if the user decides to config video resolution
> to 1920x1080.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> ---
>  board/arm/juno/linux-juno-defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
