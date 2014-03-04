From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:22:48 +0100
Subject: [Buildroot] [PATCH] eudev: disable manpages
In-Reply-To: <1393950611-6873-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393950611-6873-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140304192248.7630d1ae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  4 Mar 2014 13:30:11 -0300, Gustavo Zacarias wrote:
> If host-libxslt or some libxslt is around (xsltproc) eudev will try to
> build manpages with it. Problem is docbook DTDs might not be around and
> things will break. We want no manpages anyway. Fixes:
> http://autobuild.buildroot.net/results/c4e/c4e920b16c57e79df979f00cceaea7c0483f043c/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/eudev/eudev.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
