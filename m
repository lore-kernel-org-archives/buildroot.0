From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Feb 2010 20:08:32 +0100
Subject: [Buildroot] [git commit master] xfont_font-util: convert to the
	autotools infrastructure
In-Reply-To: <4B86AFC2.1010508@carallon.com> (William Wagner's message of
	"Thu, 25 Feb 2010 17:13:38 +0000")
References: <20100223202924.D6947776A1@busybox.osuosl.org>
	<4B86AFC2.1010508@carallon.com>
Message-ID: <87k4u15e1b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "William" == William Wagner <will_wagner@carallon.com> writes:

 William> Have just pulled this change and it does not work. The problem is that
 William> $(@D) is output/build/xfont_font-util-1.0.1 as the rule we are
 William> currently evaluating is
 William> output/build/xfont_font-util-1.0.1/.stamp_staging_installed but the
 William> script is in package/x11r7/xfont_font-util

 William> The attached patch fixes this issue

Committed, thanks!

-- 
Bye, Peter Korsgaard
