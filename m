From: Mario Lang <mlang@blind.guru>
Date: Thu, 20 Sep 2018 14:11:28 +0200
Subject: [Buildroot] [PATCH 1/1] brltty: use gcc instead of ld to link
 shared objects
In-Reply-To: <20180919214515.25460-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 19 Sep 2018 23:45:15 +0200")
References: <20180919214515.25460-1-fontaine.fabrice@gmail.com>
Message-ID: <87fty4tllb.fsf@home.blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

> Bump to version 5.6 has reintroduced the issue fixed by patch 854093 on
> version 5.5.
>
> Indeed, third patch was merged upstream but it was then reverted:
> https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416
>
> Moreover, since commit 3a2e3f6fa5ef0a210ffeba5ed05c79965d0cc3c7, MKOBJ
> was renamed into MKREL. So, instead of patching again brltty, overwrite
> MKREL to use "gcc -shrared -o" instead of "ld -r -o".
>
> Fixes:
>  - http://autobuild.buildroot.org/results/31f682838b3d3b2c7103b5c51f2aba0b89d4f630

Thanks for caring!  Looks fine.

-- 
CYa,
  ?????
