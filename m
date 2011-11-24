From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 24 Nov 2011 16:08:47 -0500
Subject: [Buildroot] commit bf4465 (ncurses: fix hanging installation
 due to old version of tic)
In-Reply-To: <20111124215742.7678dab4@skate>
References: <CAHUNapT5XD1ghKZgfH1nVsiOEqpjfxUcTTHp5NCNa_C7+rEEJg@mail.gmail.com>
 <20111124215742.7678dab4@skate>
Message-ID: <CAHUNapR1xfZahWU+Ru+Vb5hdOCH1tvz1DqT-aSBEVuku7aEHNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 24, 2011 at 3:57 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 24 Nov 2011 15:47:23 -0500,
> Trevor Woerner <twoerner@gmail.com> a ?crit :
>> Could $(call AUTOTARGETS,host) be tweaked to automatically include
>> host-automake implicitly?
>
> It already does if <pkg>_AUTORECONF = YES.

Ah, and the ncurses packages does not. Shouldn't it?
