From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 21:55:02 +0200
Subject: [Buildroot] [PATCH] libcurl: drop polarssl support
In-Reply-To: <1397570346-25849-1-git-send-email-gustavo@zacarias.com.ar>
References: <1397570346-25849-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140415215502.4f63c2f9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 15 Apr 2014 10:59:06 -0300, Gustavo Zacarias wrote:
> As of curl 7.36.0 it doesn't support polarssl < 1.3 any longer. Fixes:
> http://autobuild.buildroot.net/results/d82/d82c3618e9dde3da7e36ba2b58545a9a8de5e442/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libcurl/libcurl.mk | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
