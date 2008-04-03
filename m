From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Apr 2008 21:00:32 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package: festival
	festival/festival festival/lex etc...
In-Reply-To: <20080403171347.45CE63C347@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 3 Apr 2008 10\:13\:47 -0700 \(PDT\)")
References: <20080403171347.45CE63C347@busybox.net>
Message-ID: <87ve2yzru7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-04-03 10:13:46 -0700 (Thu, 03 Apr 2008)
 ninevoltz> New Revision: 21627

 ninevoltz> Log:
 ninevoltz> add festival speech synthesis package from University of Edinburgh

Neat.

 ninevoltz> +FESTIVAL_VERSION = 1.96-beta
 ninevoltz> +FESTIVAL_SOURCE = festival-$(FESTIVAL_VERSION).tar.gz
 ninevoltz> +FESTIVAL_SITE = http://festvox.org/packed/festival/latest

That doesn't sound like a very stable URL :/

The /packed/festival/1.96 directory seems to have the same contents,
wouldn't it be better to use that instead?

-- 
Bye, Peter Korsgaard
