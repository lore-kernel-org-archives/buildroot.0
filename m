From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Apr 2014 23:41:45 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-07
In-Reply-To: <CAMo8BfL7qvw6HgUtB62XJne2i_irrgWCwB4wtkGBvpP-X1M72w@mail.gmail.com>
References: <20140408063009.EA284100CF4@stock.ovh.net>
 <CAMo8BfL7qvw6HgUtB62XJne2i_irrgWCwB4wtkGBvpP-X1M72w@mail.gmail.com>
Message-ID: <20140408234145.4ed87c17@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Wed, 9 Apr 2014 01:00:51 +0400, Max Filippov wrote:
> On Tue, Apr 8, 2014 at 10:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Build statistics for 2014-04-07
> [...]
> >     xtensa |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/959b77fa2c1f13b1958b234803437e09734e882e/
> 
> Couldn't reproduce. But I had to disable BR2_PACKAGE_HOST_SAM_BA,
> otherwise it refused to build with the following message:
> 
> Your Buildroot configuration uses pre-built tools for the x86 architecture,
> but your build machine uses the x86-64 architecture without the 32
> bits compatibility library.

I think we can safely assume that the problem is not due to
BR2_PACKAGE_HOST_SAM_BA. I'll try to reproduce the same build failure
on the autobuilder, and gather the config.log file of php. I'll let you
know.

Thanks a lot for your investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
