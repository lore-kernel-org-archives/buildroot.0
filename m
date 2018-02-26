From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Feb 2018 18:57:07 +0100
Subject: [Buildroot] [PATCH RFC next] package/linux: drop useless
 intermediate DTS booleans
In-Reply-To: <20180226174721.5785-1-yann.morin.1998@free.fr>
References: <20180226174721.5785-1-yann.morin.1998@free.fr>
Message-ID: <20180226185707.75c792db@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 18:47:21 +0100, Yann E. MORIN wrote:
> Just use whatever the user specified in the list. An empty list means no
> DTS was specified.
> 
> No need to add legacy option, as the behaviour does not change.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Simon van der Veldt <simon.vanderveldt@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> This is an RFC patch, totally untested, as an attempt to fix the fallout
> of allowing both in-tree and out-of-tree DTS files at the same time.
> It's here just to kickstart a discussion, especially about the help
> texts... ;-)

Yes, I agree with this direction. When I saw the patch allowing to
generate both in-tree and out of tree DTS, I also thought "but why do
we keep those booleans". Next time I should not only "think" but also
write it in an e-mail as a reply to the patch :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
