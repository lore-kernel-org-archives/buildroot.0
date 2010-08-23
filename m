From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 23 Aug 2010 02:06:46 +0000 (UTC)
Subject: [Buildroot] About cygwin
References: <AANLkTikn0oGbsQFbPg-JeX7=5EnY-3AyYpVNPk7qkYkh@mail.gmail.com>
	<AANLkTinY8Ko+8=1yu0-AMUcP16rawcb=YydUhYh=RSh3@mail.gmail.com>
	<20100822130319.2cb6e9e3@surf>
Message-ID: <i4sl3m$ori$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-08-22, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> On Sat, 14 Aug 2010 10:27:25 +1000
> Mitch Davis <mjd+buildroot@afork.com> wrote:
>
>> Disclaimer: I may be wrong as I'm not part of buildroot team, just
>> trying to help.
>
> You're correct: we don't support Cygwin. I'm not personally
> interested by adding Cygwin support to Buildroot, and I think that
> trying to do embedded Linux development inside Cygwin doesn't make
> sense, you'd better use Linux on your development workstation.

I've spent time supporting devlopment for eCos under Cygwin using Gnu
toolchains.  It's painful.  It's a minor miracle that Cygwin works at
all, and it's a major miracle that it works as well as it does.  But
it's still a constant, nagging souce of issues.

> Now, if someone steps in and wants to improve Buildroot to support
> Cygwin, why not,

Because somebody who wants to do that is missing more than a few
clues.  I'd be rather wary of any changes they make.  1/2 :)

> but we'll have to see how invasive the changes are. I don't think we
> want to merge invasive Cygwin-specific changes if no-one is going to
> maintain them on the long term. As none of the current main Buildroot
> contributors use Windows and Cygwin, Cygwin support is probably going
> to be broken quite often by mistake due to improvements we make to
> Buildroot. 
>
> Of course, that's my own personal point of view, not the one of the
> Buildroot project as a whole.

Wanting to do Linux development under Windows instead of Linux is just
plain nuts.  Even installing Linux on a VM is easier and will work a
lot better.

-- 
Grant
