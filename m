From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Sep 2015 11:38:20 +0200
Subject: [Buildroot] [PATCH 3/3] uclibc: symlinks are automatically
	created by uClibc-ng makefile
In-Reply-To: <20150905152522.GA23333@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sat, 5 Sep 2015 17:25:22 +0200")
References: <20150905152522.GA23333@waldemar-brodkorb.de>
Message-ID: <874mj7lwfn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

The commit message could imho have been a bit more detailed. It used to
be a problem, but with v1.0.6 this is fixed and we can drop the local
workaround.

Committed with the description extended, thanks.

-- 
Bye, Peter Korsgaard
