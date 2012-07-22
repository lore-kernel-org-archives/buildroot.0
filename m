From: Alex Bradbury <asb@asbradbury.org>
Date: Sun, 22 Jul 2012 19:27:17 +0100
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
	actions
In-Reply-To: <CAHXCMMK0J9pvVcXTfRApAcSYG+yxxOVffD_5goqF1OaBGEKROg@mail.gmail.com>
References: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
 <20120720222722.5f89af04@skate>
 <20120720233136.GA25851@mail.sceen.net>
 <20120721145411.6e291ad2@skate>
 <20120721151730.GA2543@mail.sceen.net>
 <CAHXCMMK0J9pvVcXTfRApAcSYG+yxxOVffD_5goqF1OaBGEKROg@mail.gmail.com>
Message-ID: <CA+wH294311rh_e5HP8itswfG149Or1bOoKQ_GzAymRhVPRW9eA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 July 2012 17:14, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi all,
>
> Here, I'll try to sum up what we talked few days ago on the IRC
> channel, plus give my opinion about this.
>
> To be honest, the first time i tried these -reconfigure and -rebuild
> targets, I was surprised they didn't behave as I would expect from
> targets named like that, rebuilding not only the package but the
> images too. So, I keep doing things by hands... though I understand
> why things were implemented like this.

I'm a newcomer to buildroot and was surprised by the effect of
-reconfigure and -rebuild. I'd read about them in the slides from one
of Tom's talks, and given their description I had assumed they would
rebuild only the package. Reading the responses here, I can see why it
is useful to have a target that rebuilds a single package and also
makes the image (though really, it seems not that hard for the user to
do another make command to build the image in that case). I would love
to see a build target with the proposed semantics.

Alex
