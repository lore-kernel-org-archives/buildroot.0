From: Andreas Schweigstill <andreas@schweigstill.de>
Date: Fri, 29 Aug 2008 13:35:45 +0200
Subject: [Buildroot] pre-build cross-compiler for ARM9's
In-Reply-To: <ed4892840808290030n293fc25fo9ddb2522d3046084@mail.gmail.com>
References: <ed4892840808290030n293fc25fo9ddb2522d3046084@mail.gmail.com>
Message-ID: <48B7DF11.8040005@schweigstill.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

Steven Woody schrieb:
> Does buildroot have a pre-build cross-compiler for ARM9's for download?  Thanks.

You probably didn't understand the purpose of Buildroot. It's a system
which allows you to build you own toolchain and packages. There are far
too many configurations to offer them as precompiled downloads. If you
need a precompiled GCC based cross-compiler toolchain take a look at
ELDK or the Codesourcery products.

With best regards
Andreas Schweigstill

-- 
Dipl.-Phys. Andreas Schweigstill
Schweigstill IT | Embedded Systems
Schauenburgerstra?e 116, D-24118 Kiel, Germany
Phone: (+49) 431 5606-435, Fax: (+49) 431 5606-436
Mobile: (+49) 171 6921973, Web: http://www.schweigstill.de/
