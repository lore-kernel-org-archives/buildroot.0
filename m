From: Will Newton <will.newton@gmail.com>
Date: Wed, 8 Jul 2009 10:19:04 +0100
Subject: [Buildroot] Buildroot fails to to compile uClibc-NPTL
In-Reply-To: <1246997520.32432.396.camel@localhost.localdomain>
References: <1246997520.32432.396.camel@localhost.localdomain>
Message-ID: <87a5b0800907080219i41f693e3mb8f0450a349758a0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 7, 2009 at 9:12 PM, Cristi
Magherusan<Cristi.Magherusan@net.utcluj.ro> wrote:
> Hello,
>
> I tried to get the NPTL branch to build in buildroot, but it fails due
> to some circular symbols dependencies, from what I could tell. It fails
> both in sh4 and in the experimental x86 port that I'm working on, with
> similar errors, caused by the __libc_errno symbol which is missing. They
> both build on their own (sh4 needs some minor fixes in order to build).
>
> Is there anyone interested in getting it work, and able to help me on
> this issue?

It may be better to ask this question on the uClibc list. Getting
uClibc to build with NPTL seems to be problematic at the moment.
