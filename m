From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 25 Jun 2013 17:26:58 +0200
Subject: [Buildroot] [Q] Buildroot vs uCLinux
In-Reply-To: <CALF0-+Wpm=JN0jOk8mu4QgaEvRvvbOw1mM4T6W8mYLMtSh2qSg@mail.gmail.com>
References: <CALF0-+Wpm=JN0jOk8mu4QgaEvRvvbOw1mM4T6W8mYLMtSh2qSg@mail.gmail.com>
Message-ID: <51C9B6C2.4040302@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 24.06.2013 19:57, schrieb Ezequiel Garcia:
> Hi everyone,
>
> I'm working on a project where the customer has decided to use uCLinux
> as the base distribution on a MMU platform.
>
> Can anyone give me any insights on what would be the differences between
> this choice, and choosing buildroot instead?
Hello,

one of the biggest differences is that uClinux comes with all the
sourcecode in one giant repository while buildroot downloads only the
sourcecode that you selected for your project.

Regards

Stephan
>
> AFAIK, they're both source-oriented, uclibc-based distributions.
> uCLinux seems more
> biased towards MMU-less platforms, but since this is not the case, I'd
> like to know
> if there's something I'm missing, before I suggest my customer to try
> Buildroot instead.
>
> Thanks a lot!
