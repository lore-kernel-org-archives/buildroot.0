From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 23:19:23 +0200
Subject: [Buildroot] [PATCH v2] uclibc: fix clock_nanosleep declaration
In-Reply-To: <20180505145130.GA16360@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sat, 5 May 2018 16:51:31 +0200")
References: <20180505145130.GA16360@waldemar-brodkorb.de>
Message-ID: <87wowgo52c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Fixes autobuild errors:
 >  http://autobuild.buildroot.net/results/a58007263355e2734a8074d52b1b26b88973c39e
 >  http://autobuild.buildroot.net/results/7d6fd0872efd23c7de552ab637956902b43c3f58

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > Reported-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v1 -> v2: declare the functions independent from thread support

Committed, thanks.

-- 
Bye, Peter Korsgaard
