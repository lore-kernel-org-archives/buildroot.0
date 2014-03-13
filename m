From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Thu, 13 Mar 2014 16:15:19 +0530
Subject: [Buildroot] Switching from uClibc to glibc as the default in
	Buildroot?
In-Reply-To: <20140312202417.GC6240@nbbrfq.cc.univie.ac.at>
References: <20140218231447.524a1a20@skate>
 <CAMKF1soCcLba_EacJLe7f9fM9=gFsTJYj0kaz6YzoXzEY1rx2A@mail.gmail.com>
 <fd7802bd-3f37-4d70-ad22-2e46fc452b4b@email.android.com>
 <66DCE5C2-E7A6-4634-8C79-441DA9FC46FB@gmail.com>
 <20140219092112.6f359a55@skate> <87y5171p19.fsf@dell.be.48ers.dk>
 <CAAXf6LXoZ_dQNoy=z7u4ww-j2Eppe3mMiYn+6t=_x3odwBwGWA@mail.gmail.com>
 <20140312202417.GC6240@nbbrfq.cc.univie.ac.at>
Message-ID: <53218C3F.8090204@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 13 March 2014 01:54 AM, Bernhard Reutner-Fischer wrote:
> On Fri, Mar 07, 2014 at 09:07:27AM +0100, Thomas De Schampheleire wrote:
>> > Hi all,
>> > 
>> > On Wed, Feb 19, 2014 at 9:32 AM, Peter Korsgaard <jacmet-2zL2ArBv0bUdnm+yROfE0A@public.gmane.org> wrote:
>>>>>>>> > >>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
>>> > >
>>> > >  > Dear Khem Raj,
>>> > >  > On Tue, 18 Feb 2014 18:43:41 -0800, Khem Raj wrote:
>>> > >
>>> > >  >> > There are a great number of fixes since the last numbered release and I for one would greatly appreciate having at least a "testing" release with a bumped version number to use. Other than the ldso stat call problem I reported a couple of weeks ago, uClibc trunk has been working fairly well, and most bugs I run into are the typical growing pains of toolchain building from scratch rather than uClibc problems.
>>> > >  >>
>>> > >  >> so get going start testing git/master and report issues or successes you have.
>>> > >  >> help in testing it out, run uclibc test suites or any others you have setups for
>>> > >
>>> > >  > Please break the chicken-and-egg problem, and release 2014.02-rc1 right
>>> > >  > now, spit out a call for testing, and release 2014.02 at the end of the
>>> > >  > month. (Or pick any other date you want, those are just suggestions).
>>> > >
>>> > > Inded. When Bernard suggested the same last year I did test and reported
>>> > > issues, but never got any reply:
>>> > >
>>> > > http://lists.uclibc.org/pipermail/uclibc/2013-November/048093.html
>>> > >
>> > 
>> > Any further evolution in this matter?
>> > 
>> > Until now, this mail thread did not seem to have triggered any real
>> > activity from the uClibc community.
>> > 
>> > Khem Raj: what is the plan forward? You have requested patches to be
>> > sent, and testing to be performed, and the Buildroot community has
>> > responded by telling that we only have patches that are already in the
>> > uClibc tree (unreleased) and we have been testing this for a long
>> > while already, without problems.
>> > 
>> > Maybe you feel this is not enough, in which case kindly provide more
>> > details about what you consider blocking points to make a release, or
>> > even a release candidate.
> Well, see ML archives with a mail from Peter who tested a somewhat
> recent master and found ARM !LFS to be broken (i still consider !LFS to
> be an important thing to support, despite the maintenance burden).
> [the exact november mail above, btw]
> We have touched this on master as
> 00571b43df2e0554d1b0716681832ba9975177c5 so this in fact did trigger a
> reaction from "the uClibc community". No reaction from the buildroot
> folks that current master resolved this !LFS ARM failure. Zilch.
> See?


I'm not sure if ARM !LFS failure is the same but I've posted (and reminded at
least once) regarding a !LFS build failure on ARC.

http://lists.uclibc.org/pipermail/uclibc/2014-January/048174.html
http://lists.uclibc.org/pipermail/uclibc/2014-February/048215.html

-Vineet
