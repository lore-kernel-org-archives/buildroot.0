From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jan 2013 20:59:56 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-01-28
In-Reply-To: <CAKcgs2zMQeybp4TA+6nJ8tTdfb173S+u6Fwd8jCrEw_USv5f=w@mail.gmail.com>
References: <20130129073424.4F9F552C08C@lolut.humanoidz.org>
 <CAKcgs2zUHb7CHnuBbPBeXNZ5jTiFJ7vZG0mu6TK50F57vSLw3Q@mail.gmail.com>
 <20130129203915.14e6a5fb@skate>
 <CAKcgs2zMQeybp4TA+6nJ8tTdfb173S+u6Fwd8jCrEw_USv5f=w@mail.gmail.com>
Message-ID: <20130129205956.5488353e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gilles Talis,

On Tue, 29 Jan 2013 11:46:08 -0800, Gilles Talis wrote:

> Thanks a lot for this clear explanation. This answer my questions.
> Process seems fair enough to me. My only question for the moment
> would be how do we make sure two (or more) people are not working on
> fixing the same issue? If I want to fix a specific failure, should I
> send an email to everyone saying "hey, I am working on build failure
> X"? What is the usual process here?

As I said there is no formal process. Many build fixes are quite simple
to fix, so we just fix it and send a patch, that's it. Since the fix is
quick enough to do, there isn't a very big chance that someone else is
working on it.

For more complex cases, we send an e-mail, typically in reply to the
autobuilder e-mail, quoting the relevant build failure, and saying that
we're working on it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
