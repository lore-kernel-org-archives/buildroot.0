From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jul 2015 23:45:17 +0200
Subject: [Buildroot] [PATCH v1] racehound: fix kernel module compile
In-Reply-To: <1437081852-30727-1-git-send-email-ps.report@gmx.net>
References: <1437081852-30727-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150716214517.GA4472@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-07-16 23:24 +0200, Peter Seiderer spake thusly:
> - check for linux kernel >= 3.14
> - add cross compile enviornment for linux kernel compile
> - add additional kernel config hint (CONFIG_KALLSYMS_ALL)
> - fix kernel module install path

Could you see if it were possible to use the newly introduced
kernel-module infrastructure to build this kernel module, please?

    http://nightly.buildroot.org/#_infrastructure_for_packages_building_kernel_modules

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
