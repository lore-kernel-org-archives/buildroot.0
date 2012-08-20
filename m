From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Mon, 20 Aug 2012 17:06:41 +0200
Subject: [Buildroot] [PATCH v3] at91bootstrap3: new package
In-Reply-To: <CAHt8ZCOE1g+0cj+cKH1Y-PJodvRGfMykH33B2Wqmz0+pA2gg=g@mail.gmail.com>
References: <1345192583-5115-1-git-send-email-spdawson@gmail.com>
 <20120820120718.GA6060@game.jcrosoft.org>
 <CAHt8ZCOE1g+0cj+cKH1Y-PJodvRGfMykH33B2Wqmz0+pA2gg=g@mail.gmail.com>
Message-ID: <20120820150641.GB6060@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13:14 Mon 20 Aug     , Simon Dawson wrote:
> Hi Jean-Christophe; thanks for the feedback.
> 
> On 20 August 2012 13:07, Jean-Christophe PLAGNIOL-VILLARD
> <plagnioj@jcrosoft.com> wrote:
> > Nack on this barebox does need this and boot slower You must put this as an
> > option
> >
> > Best Regards,
> > J.
> 
> I'm sorry, but I don't understand your comment(s). Could you please clarify?
this path you apply slow down the boot => Nack

U-Boot is not the only bootlaoder on at91 other does not need it as barebox

so you can not apply it if we do not need it

Best Regards,
J.
