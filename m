From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Mar 2013 17:32:21 +0100
Subject: [Buildroot] [uclinux-dist-devel] [Announcement] The 2012R2
 buildroot Linux release for Blackfin
In-Reply-To: <CAAXf6LVArO=ttzj1zkz9wkxyRWkUMOU3OJQaQ0bPBykq4gt8BA@mail.gmail.com>
References: <DB904C5425BA6F4E8424B3B51A1414D173F6FB6E58@NWD2CMBX1.ad.analog.com>
 <20130307095939.1316014e@skate>
 <DB904C5425BA6F4E8424B3B51A1414D173FF40BA46@NWD2CMBX1.ad.analog.com>
 <20130307121430.2780392a@skate>
 <DB904C5425BA6F4E8424B3B51A1414D173FF40BDC3@NWD2CMBX1.ad.analog.com>
 <20130308093352.73ab92e5@skate>
 <CAAXf6LVArO=ttzj1zkz9wkxyRWkUMOU3OJQaQ0bPBykq4gt8BA@mail.gmail.com>
Message-ID: <20130308173221.50ef6b30@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 8 Mar 2013 15:52:12 +0100, Thomas De Schampheleire wrote:

> > That's also why I was proposing you to get started with all the package
> > changes first. They are a lot easier to handle, less intrusive, and
> > therefore easier to get merged.
> 
> I fully agree with Thomas P. that integrating the Blackfin changes
> into mainline buildroot would be beneficial for both the buildroot as
> the Blackfin community. As Thomas indicated, the buildroot community
> is now more alive than ever, and I'm sure that a new series of
> buildroot patches from the Blackfin community will not go unnoticed,
> especially now that you're in the middle of our radar ;-)

I agree. One example of a good thing you will benefit from being part
of the wider Buildroot community is for example our autobuilder
infrastructure. It tests which packages are building properly or not
building properly, and ultimately helps in improving Buildroot's
quality and therefore the user experience. Our autobuilders are already
regularly building Blackfin configurations.

> By the way: I don't see Sonic's replies appearing on the buildroot
> mailing list. Is it possible to keep that list in copy?

Sonic e-mails have the Buildroot list in Cc. I'm not sure why they
don't make it to the list. Probably because he is posting with his
@analog.com address, while he is subscribed with an @gmail.com address
on the Buildroot list.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
