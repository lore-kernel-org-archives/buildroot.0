From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Apr 2014 15:34:34 +0200
Subject: [Buildroot] [PATCH] freetype: host variant needs to run autogen
 too
In-Reply-To: <1398215421-1844-1-git-send-email-gustavo@zacarias.com.ar>
References: <1398215421-1844-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140423153434.7f2370c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 22 Apr 2014 22:10:21 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/fb8/fb8e38bcc73ff60a71df7558a1a4d6cc7cc9157f/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/freetype/freetype.mk | 1 +
>  1 file changed, 1 insertion(+)

Ouch, this one is hitting the autobuilders pretty hard.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
