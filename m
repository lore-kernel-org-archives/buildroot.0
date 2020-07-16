From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:12:36 +0200
Subject: [Buildroot] [PATCH] package/gdb: fix gdb python support with
 python 3.8
In-Reply-To: <20200623131649.632256-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 23 Jun 2020 15:16:49 +0200")
References: <20200623131649.632256-1-romain.naour@gmail.com>
Message-ID: <87h7u7v6hn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > CPython 3.8 has added a new Syntax Warning that print
 > a waring at runtime while unsing gdb python support.

 > $ gdb -ex "python import os"
 > /usr/share/gdb/python/gdb/command/prompt.py:48: SyntaxWarning: "is not" with a literal. Did you mean "!="?
 >   if self.value is not '':
 > /usr/share/gdb/python/gdb/command/prompt.py:60: SyntaxWarning: "is not" with a literal. Did you mean "!="?
 >   if self.value is not '':

 > Backport an upstream patch for this:
 > https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=b6484282f85bf7f11451b2441599c241d302ad9d

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
