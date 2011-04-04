From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Apr 2011 21:28:38 +0200
Subject: [Buildroot] [PATCH] ncurses: version bump to 5.8
In-Reply-To: <BANLkTimaGrpddCjV6r7MkmiK9P1-GeiLDQ@mail.gmail.com> (Mike
	Frysinger's message of "Mon, 4 Apr 2011 15:17:24 -0400")
References: <1300923770-13698-1-git-send-email-vapier@gentoo.org>
	<871v1iz4rw.fsf@macbook.be.48ers.dk>
	<BANLkTin76g-S7ukNdq62ie3fJaMTc_7fag@mail.gmail.com>
	<87wrj9ygui.fsf@macbook.be.48ers.dk>
	<BANLkTimaGrpddCjV6r7MkmiK9P1-GeiLDQ@mail.gmail.com>
Message-ID: <87oc4lyfx5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 >> Ok, odd. I do see several gentoo bugs related to ncurses 5.8 though
 >> (rtorrent, vifm).

 Mike> seems like all the logged gentoo bugs are issues in the packages
 Mike> and not ncurses

Somewhat true. Looking at the Debian bugs I see ncurses 5.8 fails on
newwin(0, 0, 0, 0) which it shouldn't - That's fixed post 5.8 though.

 Mike> did you have a particular app you were running from BR that
 Mike> exhibited the issue ?

Well, everything I tried:

- python with it's readline module
- less
- dialog

-- 
Bye, Peter Korsgaard
