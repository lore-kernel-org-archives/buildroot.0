From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Jan 2017 19:52:31 +0100
Subject: [Buildroot] [PATCH] uclibc: add kernel module syscall wrappers
In-Reply-To: <20161228172901.GA24328@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Wed, 28 Dec 2016 18:29:01 +0100")
References: <20161228172901.GA24328@waldemar-brodkorb.de>
Message-ID: <87inpsrpg0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Revert the decision to remove the wrappers, but remove the extra
 > Config symbol and add it by default. Required for kmod package.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
