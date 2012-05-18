From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 May 2012 16:57:44 +0200
Subject: [Buildroot] [PATCH 1/2] vala: do not append a -dirty suffix to
	the valac version number
In-Reply-To: <CAHt8ZCNqGagUPjq4ZvfRBKogfbVfKJnRH7mR6rpL7LPYdvdtuQ@mail.gmail.com>
 (Simon Dawson's message of "Fri, 18 May 2012 14:06:54 +0100")
References: <1337170229-29684-1-git-send-email-spdawson@gmail.com>
 <87fwaxop2t.fsf@macbook.be.48ers.dk>
 <CAHt8ZCNqGagUPjq4ZvfRBKogfbVfKJnRH7mR6rpL7LPYdvdtuQ@mail.gmail.com>
Message-ID: <877gw9o7tj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

Hi,

 Simon> In essence, I think the patch is necessary in order to prevent the
 Simon> valac build process from falling foul of uncommitted changes in the
 Simon> local Buildroot checkout. Of course, if you've got uncommitted changes
 Simon> in the repository in which you're testing, then my theory goes out of
 Simon> the window...

Ahh, ok. That was not clear to me from your commit message. We have
something similar for autoconf
(autoconf-2.65-dont-add-dirty-to-version.patch). Care to adjust patch
description and commit message and resend?

-- 
Bye, Peter Korsgaard
