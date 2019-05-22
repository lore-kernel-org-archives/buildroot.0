From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 22 May 2019 08:40:50 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/iputils: fix build with
 nettle
In-Reply-To: <20190521172325.30527-1-fontaine.fabrice@gmail.com>
References: <20190521172325.30527-1-fontaine.fabrice@gmail.com>
Message-ID: <20190522064049.GB25795@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Fixes:
>  - http://autobuild.buildroot.org/results/e86555090e27b631ba35214ef100aa9331844684

FYI this fixes failures for other archs (I guess incomplete list):
      riscv64 |              iputils-s20190515 | http://autobuild.buildroot.net/results/f78ac0d3c9a679a584bd54ac7f908390f5a4087b
       xtensa |              iputils-s20190515 | http://autobuild.buildroot.net/results/a15323897950f8166f2b14f235a36cd88387d5de

Kind regards,
Petr
