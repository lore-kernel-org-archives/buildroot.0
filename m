From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 8 Feb 2020 17:21:12 +0100
Subject: [Buildroot] [PATCH 0/3] Riscv32 gcc bug 93532 workaround
In-Reply-To: <26d6a341-a746-e27a-194b-965e6cbda35e@benettiengineering.com>
References: <20200203165946.50232-1-giulio.benetti@benettiengineering.com>
 <26d6a341-a746-e27a-194b-965e6cbda35e@benettiengineering.com>
Message-ID: <824de447-89e2-7fee-975a-9f3fd43c5b79@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ah, forgot to mention that they provided a patch that solves the 
problem, so maybe I should provide it as a patch for gcc/8.3.0, right?

On 2/8/20 5:13 PM, Giulio Benetti wrote:
> Hi All,
> 
> this bug is shown only if riscv32 gcc is built with
> -fstack-protector-strong [1], so I don't know if it's better to disable
> SPP when building gcc for riscv32 version 8.x, or to keep -O0 workaround
> that is the same as Microblaze.
> 
> [1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93532
> 
> Best regards
> 

-- 
Giulio Benetti
Benetti Engineering sas
