From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 14:00:59 +0200
Subject: [Buildroot] [PATCH v2] toolchain: Fix glibc breakage
In-Reply-To: <1443958508-5943-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 4 Oct 2015 13:35:08 +0200")
References: <1443958508-5943-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87zizyq1vo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Introduced by previous patch 0f75b2635ee564fbbdb9ea631cf39fa8731d6d6c,
 > this printf would break the build of glibc, because there is no format
 > to printf:

 >     printf: usage: printf [-v var] format [arguments]

 > Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
