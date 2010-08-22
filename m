From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 13:03:19 +0200
Subject: [Buildroot] About cygwin
In-Reply-To: <AANLkTinY8Ko+8=1yu0-AMUcP16rawcb=YydUhYh=RSh3@mail.gmail.com>
References: <AANLkTikn0oGbsQFbPg-JeX7=5EnY-3AyYpVNPk7qkYkh@mail.gmail.com>
	<AANLkTinY8Ko+8=1yu0-AMUcP16rawcb=YydUhYh=RSh3@mail.gmail.com>
Message-ID: <20100822130319.2cb6e9e3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Aug 2010 10:27:25 +1000
Mitch Davis <mjd+buildroot@afork.com> wrote:

> Disclaimer: I may be wrong as I'm not part of buildroot team, just
> trying to help.

You're correct: we don't support Cygwin. I'm not personally interested
by adding Cygwin support to Buildroot, and I think that trying to do
embedded Linux development inside Cygwin doesn't make sense, you'd
better use Linux on your development workstation.

Now, if someone steps in and wants to improve Buildroot to support
Cygwin, why not, but we'll have to see how invasive the changes are. I
don't think we want to merge invasive Cygwin-specific changes if no-one
is going to maintain them on the long term. As none of the current main
Buildroot contributors use Windows and Cygwin, Cygwin support is
probably going to be broken quite often by mistake due to improvements
we make to Buildroot. 

Of course, that's my own personal point of view, not the one of the
Buildroot project as a whole.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
