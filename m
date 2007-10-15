From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Mon, 15 Oct 2007 19:40:05 +0200 (CEST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <016c01c80ef8$e931c350$9900a8c0@atmel.com>
References: <20071012210141.1DF69A5E1B@busybox.net><0710131046500.9729@somehost><1192269439.26495.4.camel@elrond.atmel.sweden><0710131212520.9729@somehost><1192300638.26495.13.camel@elrond.atmel.sweden><0710132115250.9729@somehost><1192307460.26495.27.camel@elrond.atmel.sweden>
	<0710132305350.9729@somehost>
	<016c01c80ef8$e931c350$9900a8c0@atmel.com>
Message-ID: <0710151840550.11188@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Oct 2007, Ulf Samuelsson wrote:

> Some people are against having architecture specific extensions in the
> common files.

Alright.  I see a point in that.  But I still think, as I said before:
"one size doesn't fit everybody".  If incompatibilities arise, one good
thing is to pin them down, and make them visible.  Is there another way?

> I believe it is better to continue the build, and then do a verify
> afterwards.

I don't.  Side effects can lead one on to treacherous side tracks and
troubleshooting would be more painful.

> If you read archives, a lot of people consider the libgcc_s to be a
> PITA.

But of course.  Anything that is not dead simple is PITA.

> The "-cp" -> "cp" patch has caused me several hundred hours
> of extra work,

Really?  I'm not arguing, but I find it difficult to believe.

> and this can all be blamed on Bernhard.
> Any problems caused by patches trying to fix the broken AVR32
> can therefore indirectly be blamed on Bernhard as well.

Cool down now.  I do believe that one of the reasons why this project is
not moving at faster pace is that the magic between you and Bernhard is
just not working.  And that's really sad.  That said, things won't get
better if the only noticable thing is you two disagreeing.

> In practice, I do *not* want to blame Bernhard for *that* patch, since
> it very difficult to do a full test of buildroot using all parameters.

True.

> However, Bernhard has a policy which is to always use the latest stuff,
> which makes IMHO Buildroot, nothing more than a (nice) toy.

I don't see very much wrong with that, as long as you keep things tight.
Branching was suggested more than once.  What do you say?  More work?
Yes.  More satisfied "customers"?  Oh, yes.  Me for one.  I would rather
use something that is controllable (mind you, not top of the notch) than
something that is constantly broken.

> You reported a build problem with JPEG and think that creating a
> directory in $(STAGING_DIR) during the jpeg build was the problem which
> caused the toolchain build to fail.

Your words, not mine.  I'm just an occasional visitor ;)

> You probably only need to reflect on this for a millisecond or so to
> realize how absurd that is...

I have to admit, I'm not that sharp ;)

> I rather think this is a result of Bernhards patch to deprecate older
> versions of Binutils, automatically changing an existing *working*
> ".config" into something which might, or might not work after a "make
> menuconfig".

There you go again.  Don't waste your time throwing dirt on one another!
Work together instead!  Learn from eachother.  Everyone will benefit.
Life is short and then you die, both of you and your "customers".

> Build a toolchain that works, then use an external toolchain.
> Saves you a lot of time...

Yes.  Any FAQ on that?
But still aspirine, workaround, substitute for the real thing :(
Thanks for the advice, anyway.

You two you kan keep disagreing in the back stage.  But don't do it up
front.  Work together instead.  It's much better for the "business".


Cheers,

-- 
Cristian
