From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:32:25 +0200
Subject: [Buildroot] [PATCH] gtest: fix usage on ARM platforms
In-Reply-To: <1492602712-28828-1-git-send-email-casantos@datacom.ind.br>
References: <1492602712-28828-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170420223225.15201c6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 08:51:52 -0300, Carlos Santos wrote:
> Ensure that GTest is compiled with -fPIC to allow linking the static
> libraries with dynamically linked programs. This is not a requirement
> for most architectures but is mandatory for ARM.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/gtest/gtest.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
