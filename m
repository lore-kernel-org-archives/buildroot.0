From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Aug 2010 16:20:02 +0200
Subject: [Buildroot] [PATCH 4/4] Fix externals-deps and source-check
	when building out of tree
In-Reply-To: <4C7BB4D7.4020909@carallon.com> (William Wagner's message of
	"Mon, 30 Aug 2010 14:40:39 +0100")
References: <1282732120-1561-1-git-send-email-will_wagner@carallon.com>
	<8762ytyuqc.fsf@macbook.be.48ers.dk> <4C7BB4D7.4020909@carallon.com>
Message-ID: <877hj8xjvx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "William" == William Wagner <will_wagner@carallon.com> writes:

Hi,

 William> Ok, I'll take a look at your fix to see what I did wrong!

The problem is that if you always pass O=<dir>, then it will look in
output/.config instead of ./.config when the user isn't using O=<dir>

 >> I see your patch is named 4/4, but I don't see any other patches from
 >> you around that day - Was that just a mistake or did they get lost
 >> somehow?
 >> 
 William> Was putting together some other patches for new packages, thought I'd
 William> send them after this release. Still not quite got the hang of git
 William> send-email.

Ok.

-- 
Bye, Peter Korsgaard
