From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 22:59:28 +0100
Subject: [Buildroot] [PATCH] sox: disable ssp when unavailable
In-Reply-To: <1425664385-24497-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425664385-24497-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150317225928.1ef7d626@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  6 Mar 2015 14:53:05 -0300, Gustavo Zacarias wrote:
> It seems autodetection isn't good. Fixes:
> http://autobuild.buildroot.net/results/885/885c7daec7b727d8a7cf47c7576f0e79d4a5ddf8/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/sox/sox.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
