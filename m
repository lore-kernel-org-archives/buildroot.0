From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Dec 2013 10:28:47 +0100
Subject: [Buildroot] [buildroot] libevas build failure analysis
In-Reply-To: <CACjG4BJvjp0HpOn+FvKYQt6WYNZG-uYaVth16oCfPL_ynk9k9g@mail.gmail.com>
References: <CACjG4B+qJvuzX=dZz5F7jNyc_m796_j2m9NZ91fpsoy52SX8VQ@mail.gmail.com>
 <CAKAx1cgki9JiRqU=zJJ0P8g5XpG7NEZN9WcBuYMa4mNyv2C-RA@mail.gmail.com>
 <CACjG4B+AJ0F4BmrSVrfzMidVgUFGwWt7sBoxUD3QZyp0x6+EAw@mail.gmail.com>
 <CACjG4BLqXqufuzSHYWghXcZuWMpBPjbFUU7xGzLhSjQQrghK8A@mail.gmail.com>
 <CAKAx1ciXsAPtG-uegQC5CPO8yJFPG4gn7CvuzVZ2JQh_T0FrAA@mail.gmail.com>
 <CACjG4BJvjp0HpOn+FvKYQt6WYNZG-uYaVth16oCfPL_ynk9k9g@mail.gmail.com>
Message-ID: <20131204102847.5b91870e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnaud,

On Tue, 3 Dec 2013 10:13:52 +0100, arnaud aujon wrote:

> About adding a requirement to have a toolchain with thread support,is there
> any chips/boards that can't have thread support in their toolchain ?

Huh? Having thread support or not is not related to the underlying
hardware (i.e SoC or board). It's a software choice, at the C library
configuration level. So there is absolutely no problem in requiring
thread support for something relatively large such as EFL.

> And as you said, I guess have EFL 1.7 and 1.8 for some time is a good idea.

Why?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
