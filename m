From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 17:16:36 +0100
Subject: [Buildroot] [PATCH] libsigsegv: fix sparc64 compile
In-Reply-To: <20151129145904.GA12312@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sun, 29 Nov 2015 15:59:04 +0100")
References: <20151129145904.GA12312@waldemar-brodkorb.de>
Message-ID: <87a8pvlaxn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Compile tested for sparc/glibc and sparc64/glibc.
 > Fixes following autobuilder problem:
 > http://autobuild.buildroot.net/results/1d8e0c22594aef53f7a4de3491454aa78311c815/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > --- 
 > Debian has a similar fix, but they don't care for sparc.

So why do they carry the fix?

Committed, thanks.

Please try to submit the fix upstream.

-- 
Bye, Peter Korsgaard
