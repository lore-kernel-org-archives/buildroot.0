From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:49:26 +0200
Subject: [Buildroot] [PATCH] gmp: bump to version 6.0.0a
In-Reply-To: <1396534496-20980-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396534496-20980-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140404234926.1b4f72d5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  3 Apr 2014 11:14:56 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gmp/gmp.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Fails to build on ARM Thumb2:

  http://autobuild.buildroot.org/results/f44/f447ce933ad8dd975b17aeda03cc46b0cace0b03/build-end.log

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
