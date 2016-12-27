From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Dec 2016 10:37:49 +0100
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.21
In-Reply-To: <20161226192948.GA11926@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Mon, 26 Dec 2016 20:29:48 +0100")
References: <20161226192948.GA11926@waldemar-brodkorb.de>
Message-ID: <87inq5d85u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Remove all patches as they are upstream.
 > Remove MALLOC_GLIBC_COMPAT and UCLIBC_HAS_OBSTACK as they got removed.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > the patch shouldn't be applied before:
 >   busybox: fix modutils compile

Committed, thanks.

-- 
Bye, Peter Korsgaard
