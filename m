From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 21:46:00 +0200
Subject: [Buildroot] [PATCH v2 1/4] core: reverse the argument order in
 check-host-cmake
In-Reply-To: <1494131541-2960-1-git-send-email-casantos@datacom.ind.br>
References: <1494131541-2960-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170624214600.1111506c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 May 2017 01:32:18 -0300, Carlos Santos wrote:
> Pass the minimal version before the program name. In a later change the
> script will become able to test a list of candidates.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  support/dependencies/check-host-cmake.mk | 2 +-
>  support/dependencies/check-host-cmake.sh | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, series applied to master! And thanks to Yann for reviewing
those patches.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
