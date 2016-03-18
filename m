From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 18 Mar 2016 19:49:31 -0300
Subject: [Buildroot] [PATCH v2 00/17] ARM Cortex-M support and STM32
 defconfigs
In-Reply-To: <20160318221727.64755b08@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160318221727.64755b08@free-electrons.com>
Message-ID: <20160318224931.GA19174@laptop.cereza>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18 Mar 10:17 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 18 Mar 2016 22:08:02 +0100, Thomas Petazzoni wrote:
> 
> > Here is the v2 of the patches that add support for ARM Cortex-M and
> > STM32 defconfigs.
> 
> This whole series is available at:
> 
>   http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=cortexm-uclibc-thumb
> 

Thanks for the branch. Tested on LPC4350 Hitex Eval board and it worked
fine:

Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.5.0-rc2-00312-gd183ca0d53b6 (zeta at laptop) (gcc version 4.9.3 (Buildroot 2016.05-git-00495-ga84162dcafb9-dirty) ) #220 PREEMPT Fri Mar 18 19:43:33 ART 2016
[etc]

Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
