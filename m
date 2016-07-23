From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 22:58:55 +0200
Subject: [Buildroot] [PATCH] libunwind: needs ARM instruction support
In-Reply-To: <1469287474-4391-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469287474-4391-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160723225855.0f054ded@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 12:24:34 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/4cf/4cf517cd81d3aa5da26848edaba5df0bfbab2c77/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libunwind/Config.in | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
