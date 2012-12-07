From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Dec 2012 10:02:45 +0100
Subject: [Buildroot] Support of iMX6 hardware ?
In-Reply-To: <CAHXCMMJOCtRun6xCjX_sZfQcZxWZLMyVVBnrbzUY1oAhXU7HDw@mail.gmail.com>
References: <50C06206.6060905@wanadoo.fr> <20121206124855.796d4d38@skate>
 <50C198AD.8030703@wanadoo.fr> <20121207091426.316173d6@skate>
 <CAHXCMML8DZ+f5euA__rE4v3bSzi2O0KqpZ4odGtoOm6sAo6f_w@mail.gmail.com>
 <20121207093816.3722030d@skate>
 <CAHXCMMJOCtRun6xCjX_sZfQcZxWZLMyVVBnrbzUY1oAhXU7HDw@mail.gmail.com>
Message-ID: <20121207100245.4fb8ef47@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 7 Dec 2012 09:55:41 +0100, Samuel Martin wrote:

> They are working on it, see:
> http://www.armadeus.com/wiki/index.php?title=Buildroot_Mainline_integration

Great.

> And here, the WIP branch of what I've already done, and I plan to
> post shortly:
> https://github.com/tSed/buildroot/commits/sma/armadeus-integration

Good. Please submit step by step: if you spam us with hundred patches,
we'll never see the end of it.

> It's just a slow process, not necessarly time-to-market-friendly at
> first look! ;-)

The time-to-market excuse is a bad excuse because it is very often
wrong, especially for Buildroot where the barrier to entry is quite
low (writing Buildroot code that gets accepted is quite easy). Armadeus
has been carrying those Buildroot patches for multiple years, and
everytime they upgrade to a newer Buildroot release, they have to
upgrade those patches as well. I am pretty sure that the time they have
spent upgrading those patches and upgrading their Buildroot versions is
significantly larger than the time it would have taken to get those
improvements merged in the first place.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
