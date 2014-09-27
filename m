From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 27 Sep 2014 09:55:09 +0200
Subject: [Buildroot] [PATCH 3/3] qemu-ppc: update kernel to latest for
	g3beige emulation
In-Reply-To: <20140926165813.GA21134@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Fri, 26 Sep 2014 18:58:13 +0200")
References: <20140926165813.GA21134@waldemar-brodkorb.de>
Message-ID: <87r3yxwl9e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Update Linux Kernel to 3.16.3.
 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

For the future, please use the -M option for rename detection (or stick
it in your ~/.gitconfig) so the patches are easier to review.

-- 
Bye, Peter Korsgaard
