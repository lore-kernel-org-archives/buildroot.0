From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 09:48:24 +0200
Subject: [Buildroot] autobuild statistics graph
In-Reply-To: <CAAXf6LWFMtmDpFvZODkd3N_Wsk-VwNP-QVkquRhn3B2aiOjCqg@mail.gmail.com>
References: <CAAXf6LW8axKFZpiQFjmqWcFXTEqaHoD3uX=hk5ZSQbmz_7BabA@mail.gmail.com>
 <20130828091036.1a91b786@skate>
 <CAAXf6LWFMtmDpFvZODkd3N_Wsk-VwNP-QVkquRhn3B2aiOjCqg@mail.gmail.com>
Message-ID: <20130828094824.5f917f48@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 28 Aug 2013 09:42:45 +0200, Thomas De Schampheleire wrote:

> > Sounds sane. How would you compute what the reference is? Look at the
> > build results of the last 30 days (i.e the ones that appear on the
> > plot) ?
> 
> I was actually thinking of using the current calculated percentages.
> So say on day 1 there are 100 builds, with 70 successful, and on day 2
> there have been 50 builds with 25 successful, then I would plot 70%
> for the first day and 50% for the second.

Ah right, makes sense. The percentages are in fact already shown in the
table above.

> Given the variation in the configurations that are being built, a
> rising success line from one day to the next cannot be interpreted as
> an absolute reduction of bugs (could have been 'chance' because the
> bad configurations weren't built on the second day) but if you look at
> the trend it should tell us something.

Right.

> Here is some untested code that I think should do the trick (I don't
> have a PHP environment at hand here):

Your patch is now live at http://autobuild.buildroot.org/stats.php and
it seems to work. If you confirm, then I'll commit and push your patch,
with you as the author.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
