From: Arun Reddy <reddyac@gmail.com>
Date: Thu, 1 May 2008 10:23:25 -0700
Subject: [Buildroot] What is the best way to deactivate XML Parser
	(expat) for ARM build?
In-Reply-To: <4819FA71.4010901@gmail.com>
References: <326f33790805010751v24facd35o4207041c297da12c@mail.gmail.com>
	<4819E7FF.5000902@gmail.com>
	<326f33790805010916n321c394ej93bf891b65c34986@mail.gmail.com>
	<4819FA71.4010901@gmail.com>
Message-ID: <326f33790805011023t2e4e1e82v36ac31f64711029a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the response. It looks like most people have been successful with
the 9260 and 9261 def configs... I think I am going to try to rebuild from
scratch again with an earlier reference board configuration and see what
happens. It might be better for me to wait until some of these 9263 kinks
are worked out.

On Thu, May 1, 2008 at 10:14 AM, Robert Nelson <robert.nelson.work@gmail.com>
wrote:

> Hi Arun,
>
> Not 100% on that one. I also had a finished build of
> at91sam9261ek_defconfig in the same buildroot directory, which may have
> solved that dependency.. Rebuilding now from a fresh install.
>
> --
> Robert Nelson
> FAE - Digi-Key
>
> Arun Reddy wrote:
>
> > Robert,
> >
> > Thank you very much for that information! I was almost about to try to
> > do a build for at91sam9260 or a previous version just to be certain. I did
> > make expat, then after that finished I went ahead and proceeded with the
> > build by typing make. I got past the error above about libexpat, but I ended
> > up getting to an error saying:
> >
> > Checking for XML::Parser...configure: error: XML::Parser perl module is
> > required for intltool.
> >
> > Was this supposed to be resolved with make expat as well? Or does this
> > require a different package to be passed into make? Thanks again.
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080501/7bc2be19/attachment-0001.htm 
