From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 22:03:30 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: fix build error without
	OpenSSL support
In-Reply-To: <1416224516-6065-1-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 17 Nov 2014 12:41:55 +0100")
References: <1416224516-6065-1-git-send-email-jkrause@posteo.de>
Message-ID: <874mtwp6fx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > Add a patch to fix broken build of nodejs without OpenSSL support.
 > Version 0.10.33 of nodejs introduced a bug which prevents us from building
 > nodejs without OpenSSL support. The bug is reported upstream:
 > https://github.com/joyent/node/issues/8676

 > This bug caused some build errors:
 >   * http://autobuild.buildroot.net/results/0bf/0bf17bf710db051d491123482c90f2f72810804b/
 >   * http://autobuild.buildroot.net/results/e1f/e1fb34818ff1167aa008b4011befb9fd14c81293/

 > and more...

 > Signed-off-by: J?rg Krause <jkrause@posteo.de>
 > ---
 > Changes v1 -> v2:
 >   - patch nodejs to allow building without OpenSSL support (Thomas)
 >   - adapt commit log

Committed, thanks. Please don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
