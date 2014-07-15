From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 19:07:21 +0200
Subject: [Buildroot] [PATCH] polarssl: programs need MMU
In-Reply-To: <1405439559-26870-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405439559-26870-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140715190721.5c6f443b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 15 Jul 2014 12:52:39 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/b53/b535dfda85c8a25c5192c4be7540c4e852fce717/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/polarssl/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
