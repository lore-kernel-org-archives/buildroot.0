From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 27 Nov 2010 21:12:59 +0100
Subject: [Buildroot] [PATCH] package/qt: Remove selects of
	BR2_PACKAGE_QT_JAVASCRIPTCORE.
In-Reply-To: <AANLkTimdTU9wzUexhTtWEOea1mVV7_gO0Cc9ReAj7S5e@mail.gmail.com>
	(Will Newton's message of "Fri, 26 Nov 2010 13:01:16 +0000")
References: <AANLkTimdTU9wzUexhTtWEOea1mVV7_gO0Cc9ReAj7S5e@mail.gmail.com>
Message-ID: <8739qm34qc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Building WebKit or Script engine support would select JIT support
 Will> in JavaScriptCore. Not all platforms support JIT, so remove the
 Will> selects to allow the option to be modified by users.

Committed, thanks.

-- 
Bye, Peter Korsgaard
