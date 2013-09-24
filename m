From: Woody Wu <narkewoody@gmail.com>
Date: Tue, 24 Sep 2013 20:48:41 +0800
Subject: [Buildroot] Am I using hardware floating? (CodeBench)
In-Reply-To: <20130923092811.0ac82091@skate>
References: <20130921152445.GA9629@zuhnb712> <20130922103729.10b54416@skate>
 <20130922151840.GA2804@zuhnb712> <20130923092811.0ac82091@skate>
Message-ID: <CAAsE_ueLtAQAKPsEqdvfWYrkPjYCFppq+H_n0b5=pN6mcafmJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

? 2013-9-23 PM3:28?"Thomas Petazzoni" <thomas.petazzoni@free-electrons.com
>???
>
> Dear Woody Wu,
>
> On Sun, 22 Sep 2013 23:18:40 +0800, Woody Wu wrote:
>
> > Okay, understand.  For software floating, I know there are two ways,
> > one is to generating an interrupt every time a floating instruction is
> > executed, which is very slow. And, another way is let the compiler to
> > convert all floating calculation to a function call which implemented
> > in a floating library, this method is a little faster than the
> > former. My compiler is CodeBench from BR, does it have this feature
> > and has it already enabled?  Thank you very much.
>
> Yes, the Sourcery CodeBench toolchain for ARM uses soft-float for its
> ARMv5 multilib variant, which gets used if you select the arm926
> processor type in Buildroot.
>
Many thanks Thomas!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130924/e8be2e0d/attachment.html>
