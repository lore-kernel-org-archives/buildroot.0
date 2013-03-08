From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 8 Mar 2013 15:52:12 +0100
Subject: [Buildroot] [uclinux-dist-devel] [Announcement] The 2012R2
 buildroot Linux release for Blackfin
In-Reply-To: <20130308093352.73ab92e5@skate>
References: <DB904C5425BA6F4E8424B3B51A1414D173F6FB6E58@NWD2CMBX1.ad.analog.com>
 <20130307095939.1316014e@skate>
 <DB904C5425BA6F4E8424B3B51A1414D173FF40BA46@NWD2CMBX1.ad.analog.com>
 <20130307121430.2780392a@skate>
 <DB904C5425BA6F4E8424B3B51A1414D173FF40BDC3@NWD2CMBX1.ad.analog.com>
 <20130308093352.73ab92e5@skate>
Message-ID: <CAAXf6LVArO=ttzj1zkz9wkxyRWkUMOU3OJQaQ0bPBykq4gt8BA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Mar 8, 2013 at 9:33 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Zhang, Sonic,
>
> On Fri, 8 Mar 2013 02:19:01 -0500, Zhang, Sonic wrote:
>
>> I mean my new patches to address some of your feedbacks in former patches got no response.
>> http://lists.busybox.net/pipermail/buildroot/2012-August/057505.html
>> http://lists.busybox.net/pipermail/buildroot/2012-August/057506.html
>> http://lists.busybox.net/pipermail/buildroot/2012-August/057668.html
>> http://lists.busybox.net/pipermail/buildroot/2012-August/057669.html
>
> Yes, just like with any project, it is not easy to get core changes
> merged, especially when those are the first contributions from a
> developer. It requires time, patience and perseverance.
>
> That's also why I was proposing you to get started with all the package
> changes first. They are a lot easier to handle, less intrusive, and
> therefore easier to get merged.

I fully agree with Thomas P. that integrating the Blackfin changes
into mainline buildroot would be beneficial for both the buildroot as
the Blackfin community. As Thomas indicated, the buildroot community
is now more alive than ever, and I'm sure that a new series of
buildroot patches from the Blackfin community will not go unnoticed,
especially now that you're in the middle of our radar ;-)

I also agree with the approach Thomas suggests: let's start with the
simple patches like package changes. This will reduce the divergence
between both trees without too much effort, after which we can tackle
the bigger stuff.

What do you think?

By the way: I don't see Sonic's replies appearing on the buildroot
mailing list. Is it possible to keep that list in copy?

Best regards,
Thomas
