From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 22:17:55 +0100
Subject: [Buildroot] [PATCH v2 0/3] Version bumps for PRU packages
In-Reply-To: <20200115021709.64647-1-ashcharles@gmail.com>
References: <20200114005842.45810-2-ashcharles@gmail.com>
 <20200115021709.64647-1-ashcharles@gmail.com>
Message-ID: <20200203211755.GA2655@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ash, All,

On 2020-01-14 21:17 -0500, Ash Charles spake thusly:
> Bump versions for TI's PRU co-processor toolcahin and support libraries.
> 
> Note, I don't have hardware so I'm unable to confirm that these versions
> do more than build correctly.
> 
> v2: Add signed-off-by, correct license files and update/add hashes for
> licenses per [1,2]. Underlying licenses are the same.
> [1] https://patchwork.ozlabs.org/patch/1222414/#2341881
> [2] https://patchwork.ozlabs.org/patch/1222415/#2341882
> 
> Ash Charles (3):
>   ti-cgt-pru: bump to latest version 2.3.3
>   pru-software-support: bump to latest version 5.6.0
>   pru_software_support: add license file to hash

Series applied to master.

I just folded the third patch into the second one, because we already
had a hash for the license file (that was applied a bit earlier today).

Thanks! :-)

Regards,
Yann E. MORIN.

>  package/pru-software-support/pru-software-support.hash | 3 ++-
>  package/pru-software-support/pru-software-support.mk   | 9 +++++----
>  package/ti-cgt-pru/ti-cgt-pru.hash                     | 6 +++---
>  package/ti-cgt-pru/ti-cgt-pru.mk                       | 6 +++---
>  4 files changed, 13 insertions(+), 11 deletions(-)
> 
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
