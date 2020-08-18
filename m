From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Tue, 18 Aug 2020 11:19:19 +0200
Subject: [Buildroot] Package for .NET Core runtime
In-Reply-To: <20200815160407.3c712daa@windsurf.home>
References: <CAOiXNkB1uAiKUczr42uOtXQLR1ZujhhWOCyADfaUQqzVEcAH_w@mail.gmail.com>
 <20200813212833.3a8f4005@windsurf.home>
 <CAOiXNkAoGPo+dsXjkkvC=mCE+r0X2SzoxN9wMaU1B1tL1+3HYw@mail.gmail.com>
 <20200815160407.3c712daa@windsurf.home>
Message-ID: <CAOiXNkDPL9jVLSFvjdN4nc0e=BvEJhT4dHaR5_hqt1zrk-WJxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Perhaps you could start by sending with "git send-email" the patch you
> already have, so we can start giving some initial feedback ?

Will do it during the week.

> > What would be really cool is to provide support for .NET Core
> > applications similar to how it is made, for example, with Golang
> > ($(eval $(golang-package))). Together with the runtime package it will
> > enable a rather smooth way to build .NET applications with Buildroot.
>
> Thanks for those details! Considering what you said, I believe it would
> make sense to also package the .NET SDK as a host package in Buildroot,
> so that a user can easily have both the compiler on the build machine
> and the runtime on the target machine. What do you think ?

You are absolutely right. This is how it should be and I am currently
learning how to do this with Buildroot.

Regards,
Andrey.
