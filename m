From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 16:15:32 +0100
Subject: [Buildroot] [PATCH] uclibc: disable posix_madvise for noMMU
In-Reply-To: <20161129053952.GA31255@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Tue, 29 Nov 2016 06:39:52 +0100")
References: <20161129053952.GA31255@waldemar-brodkorb.de>
Message-ID: <87y4019ey3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Now that the madvise defines are disabled for noMMU targets,
 > architectures with MMU and noMMU support as ARM are failing to compile
 > in noMMU mode, since the defines are used internally in posix_madvise.c.

 > Disable compilation for posix_madvise() for noMMU.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
