From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jun 2016 10:55:22 +0200
Subject: [Buildroot] [PATCH 1/2] autofs: force hesiod and kerberos off
In-Reply-To: <1466306712-11768-1-git-send-email-gustavo@zacarias.com.ar>
References: <1466306712-11768-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160619105522.7474fc63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Jun 2016 00:25:11 -0300, Gustavo Zacarias wrote:
> Since we don't have such packages in buildroot it can pick up the distro
> config scripts and pollute the include path.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/autofs/autofs.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
