From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Jan 2011 14:57:08 +0100
Subject: [Buildroot] [PATCH] pciutils: SHARED make opt goes for install
	too
In-Reply-To: <1294667243-14845-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Mon, 10 Jan 2011 10:47:23 -0300")
References: <1294667243-14845-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877hecg8uj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> If we don't pass SHARED when installing we miss the shared library
 Gustavo> symlinks (libpci.so & libpci.so.3)
 Gustavo> On internal and external toolchains that have a proper cross ldconfig
 Gustavo> this isn't a problem but it breaks on toolchains that lack a cross ldconfig to
 Gustavo> automagically make the symlinks.

Committed, thanks.

-- 
Bye, Peter Korsgaard
