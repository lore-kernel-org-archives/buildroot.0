From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:21:08 +0200
Subject: [Buildroot] [PATCH] heimdal: disable parallel build
In-Reply-To: <1437574106-12404-1-git-send-email-gustavo@zacarias.com.ar>
References: <1437574106-12404-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150722172108.084ddba1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 22 Jul 2015 11:08:26 -0300, Gustavo Zacarias wrote:
> It still seems to have issues, so disable it pending more patches and
> testing. Fixes:
> http://autobuild.buildroot.net/results/a07/a07198b3f7f8029d80863a998814877ec9994c60/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/heimdal/heimdal.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
