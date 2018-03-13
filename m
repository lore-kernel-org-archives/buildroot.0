From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 13 Mar 2018 20:47:57 +0100
Subject: [Buildroot] [PATCH] uclibc-ng-test: fix build with musl and
 older kernel headers
In-Reply-To: <dc0715acbc8fffc5fe66d2d81e205e31bf1ba6dd.1520945641.git.baruch@tkos.co.il>
References: <dc0715acbc8fffc5fe66d2d81e205e31bf1ba6dd.1520945641.git.baruch@tkos.co.il>
Message-ID: <20180313194757.GJ2114@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
Baruch Siach wrote,

> musl libc provides its own system call macros, including
> preadv2/pwritev2. Having these macros defined is not enough to determine
> availability of other related macros in kernel headers.
 
Thanks, pushed
 best regards
  Waldemar
