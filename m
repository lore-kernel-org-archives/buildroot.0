From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 10 Sep 2011 11:11:45 +0200
Subject: [Buildroot] [PATCH] package: add Fluxbox 1.3.1 window manager
In-Reply-To: <20110803192301.4d5c4462@gmail.com> (Frederic Bassaler's message
 of "Wed, 3 Aug 2011 19:23:01 +0200")
References: <20110803192301.4d5c4462@gmail.com>
Message-ID: <87obysiwxa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frederic" == Frederic Bassaler <frederic.bassaler@gmail.com> writes:

 Frederic> Here is (hopefully!) a proper patch
 Frederic> (added signed-off line, fixed indentation and removed unnecessary lines
 Frederic> following Thomas' recommandations)

Committed with minor fixes, thanks. Fluxbox builds with iconv support
except for a minor bug which was added recently. I've fixed it and sent
the patch upstream.

-- 
Bye, Peter Korsgaard
