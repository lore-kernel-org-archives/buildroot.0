From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 17:07:29 +0200
Subject: [Buildroot] [PATCH v2] dahdi-tools: unify dependencies comments
In-Reply-To: <f00ac4110933271a8d0f4240b8ae257e31a027b7.1534498995.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 17 Aug 2018 12:43:15 +0300")
References: <f00ac4110933271a8d0f4240b8ae257e31a027b7.1534498995.git.baruch@tkos.co.il>
Message-ID: <87bma1av66.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The threads dependency comment is currently shown even though the
 > toolchain supports threads, only because kernel build is disabled.

 > Merge the kernel and threads comments. This is similar to what we have
 > in other packages that need the kernel.

 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: merge the two comments

Committed, thanks.

-- 
Bye, Peter Korsgaard
