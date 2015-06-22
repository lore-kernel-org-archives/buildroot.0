From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Jun 2015 15:56:44 +0200
Subject: [Buildroot] [PATCH] openvmtools: fix legal info
In-Reply-To: <1434885903-22713-1-git-send-email-gustavo@zacarias.com.ar>
References: <1434885903-22713-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150622155644.36d5a310@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 21 Jun 2015 08:25:03 -0300, Gustavo Zacarias wrote:
> In ab71dff0 it was moved to SUBDIR, but this was never reflected for the
> legal-info files, update this to fix:
> http://autobuild.buildroot.net/results/836/8363943cc9c967713f585209408ea087a052a12d/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openvmtools/openvmtools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied after adjusting the variable order, as suggested by Yann.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
