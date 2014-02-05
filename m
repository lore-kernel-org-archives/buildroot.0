From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Feb 2014 00:00:22 +0100
Subject: [Buildroot] [PATCH] dependencies.sh: cleanup dependencies.sh
In-Reply-To: <CAGduivzutuoD1mhfg6Oxo1DYKz+C+kak62Q0c=g_v7TehC3vuA@mail.gmail.com>
 (Maxime Hadjinlian's message of "Tue, 4 Feb 2014 23:35:23 +0100")
References: <1391459047-23665-1-git-send-email-maxime.hadjinlian@gmail.com>
 <52F1132F.1050008@lucaceresoli.net>
 <CAGduivzutuoD1mhfg6Oxo1DYKz+C+kak62Q0c=g_v7TehC3vuA@mail.gmail.com>
Message-ID: <87vbwtyxkp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 >> Are you really suggesting we should remove all nesting? Well, I guess
 >> there's been a problem with the e-mail or something...

 > Well, I asked Peter before doing this, the file contained mixed indents. We
 > thought it would be nice to have a consistent indent with the Mk files.

 > But if we find we don't want that because it removes clarity in the code. I can
 > perfectly resend with only the space/tab fixed.

 > I really don't have a strong opinion on this one. Thomas Petazzoni and Yann E.
 > Morin also found it disturbing.
 > Peter what is your decision ?

Sorry, I think I misunderstood you when you asked. I thought you
referred to indentation with a tab like make, not to drop all
indentation.

I would prefer to keep it like it is now, just with consistent indentation.

-- 
Bye, Peter Korsgaard
