From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 27 Jul 2012 09:48:29 +0100
Subject: [Buildroot] [PATCH] Added local package support.
In-Reply-To: <20120727101253.15d1af71@skate>
References: <20120724042408.GA11558@sapphire.tkos.co.il>
 <1343247448-19993-1-git-send-email-avishorp@gmail.com>
 <50107EAF.3030302@mind.be>
 <CAMkyJgA3+icHUKQ6AS==QQG--RuuptTjgy3KSdJvcwiAPxF3Rg@mail.gmail.com>
 <50124C6D.8050608@mind.be> <20120727101253.15d1af71@skate>
Message-ID: <CAHt8ZCO704n1KgBQ_5neO=oG4D=DRJnwo-U6c6Ju-yuyQ_kLBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 July 2012 09:12, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I am also a bit skeptical, but it's not yet a final and definitive
> opinion. Custom packages is one thing, but one also very often need to
> put stuff in board/ to keep kernel config, patches and various other
> stuff, though it's true nothing prevent you to use $(TOPDIR)/../ to
> keep track of all those things.

I can sort of see that this might be useful. But I wonder if there's a
more subtle sociological reason not to add the local package support.
Specifically, does it encourage a culture of users building up
stockpiles of local packages, because that's perceived to be "how you
add support for a package in Buildroot"? If so, then users might be
less likely to push their new packages upstream to Buildroot, and the
community as a whole loses out.

Maybe that's overthinking it somewhat though.

Simon.
