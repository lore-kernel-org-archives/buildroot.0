From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 22:55:39 +0200
Subject: [Buildroot] [PATCH 1/2] monkey: remove the default value of the
 MONKEY_SOURCE variable
In-Reply-To: <1437339040-2999-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1437339040-2999-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20150719225539.7ba2c86d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Sun, 19 Jul 2015 22:50:39 +0200, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/monkey/monkey.mk   | 1 -
>  1 file changed, 1 deletion(-)

Both patches applied. Thanks for spotting those issues. I reviewed and
fixed a lot of issues in the original submission of this package, but I
apparently missed some problems. Thanks for fixing them!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
