From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jul 2014 20:14:54 +0200
Subject: [Buildroot] [PATCH] toolchain/helpers.mk: don't discard
 check_arm_abi stderr
In-Reply-To: <2ffa51c027dd4f292dbaa1c0bc898100beda5695.1404405178.git.baruch@tkos.co.il>
References: <2ffa51c027dd4f292dbaa1c0bc898100beda5695.1404405178.git.baruch@tkos.co.il>
Message-ID: <20140703201454.427afda1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu,  3 Jul 2014 19:32:58 +0300, Baruch Siach wrote:
> Since we are only need to know whether the compiler runs successfully, and

s/are//

> stderr is empty for the success case, there is no need to redirect stderr to
> /dev/null. Moreover, stderr output of the failing case reveals valuable
> information on the real failure reason.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
