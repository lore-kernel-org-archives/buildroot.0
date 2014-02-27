From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Feb 2014 10:02:49 +0100
Subject: [Buildroot] [PATCH v2] website: brand new version !
In-Reply-To: <CAGduivxRCfKOx0JquDceGW6WAUipv78qo=G6gckzJ0tWzB-YMw@mail.gmail.com>
 (Maxime Hadjinlian's message of "Thu, 27 Feb 2014 09:30:14 +0100")
References: <1393456468-19111-1-git-send-email-maxime.hadjinlian@gmail.com>
 <530EDCC0.7060300@mind.be>
 <CAGduivxRCfKOx0JquDceGW6WAUipv78qo=G6gckzJ0tWzB-YMw@mail.gmail.com>
Message-ID: <87y50x9bd2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

Hi,

 >> While you're doing this, it would also be nice to move the website into
 >> a separate directory. Not that there is anything except website and
 >> manual in the docs directory, but it would clarify things. Or maybe we
 >> could even remove the docs directory and put manual and website at the
 >> top-level. Anyway, that would be in a separate, final patch.

 > I think, it was only to not clutter the root directory. But It would
 > make sense to split theses two things.

Notice that the website today is simply a git checkout (with a cronjob
to update it), so we need to get the osuosl.org guys involved if we move
it around - So I prefer to keep it where it is for now.

-- 
Bye, Peter Korsgaard
