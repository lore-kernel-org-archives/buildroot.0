From: Will Newton <will.newton@gmail.com>
Date: Wed, 7 Sep 2011 10:58:56 +0100
Subject: [Buildroot] Question related to a support to a new architecture
In-Reply-To: <CAOPDcRwGkJRgoeCjZ32ob2tKADzfmKGbQdUMfupRLns5JwGw7g@mail.gmail.com>
References: <CAOPDcRwGkJRgoeCjZ32ob2tKADzfmKGbQdUMfupRLns5JwGw7g@mail.gmail.com>
Message-ID: <CAFbHwiTq2Lq0Utg6fOW=vzcKOsiqYxnePgxEuLzdxWG04DjX-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 7, 2011 at 10:34 AM, stl <st.lambert02@gmail.com> wrote:
> Hello all,
> I am porting Linux for a new architecture, and I need to build my Linux
> system.
>
> Of course this architecture is not supported by Buildroot, so I am wondering
> if
> it is possible to do the port by myself?
>
> If so, what should be the quantity of work to do that?
>
> Thanks in advance? for your help.

It's quite simple to port buildroot to a new architecture. Assuming
you have all the standard toolchain components (gcc, binutils, uClibc)
it should be less than 1000 lines of diff.

As pointed out elsewhere the work to port Linux and the toolchain is
much greater - particularly the compiler and the kernel will take a
lot of time to implement and stabilize.
