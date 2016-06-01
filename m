From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 01 Jun 2016 21:24:01 +0200
Subject: [Buildroot] [PATCH v2] uclibc: update to 1.0.15
In-Reply-To: <20160601184025.GA21509@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Wed, 1 Jun 2016 20:40:25 +0200")
References: <20160601184025.GA21509@waldemar-brodkorb.de>
Message-ID: <87oa7ku2zy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > The Linuxthreads support got reorganized.
 > LT.new is removed, LT.old is the default for
 > Linuxthreads.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > v1 -> v2:
 >   - add Config.in.legacy entry for BR2_PTHREADS_OLD as requested
>     by Thomas Petazzoni

Committed, thanks.

-- 
Bye, Peter Korsgaard
