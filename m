From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Feb 2014 19:27:49 +0100
Subject: [Buildroot] adding nodejs to buildroot
In-Reply-To: <2DD0B9C711CDFC45A3A266C78966CE7F4531FD06@G9W0750.americas.hpqcorp.net>
References: <2DD0B9C711CDFC45A3A266C78966CE7F4531F64B@G9W0750.americas.hpqcorp.net>
 <20140219092723.112c19ab@skate>
 <2DD0B9C711CDFC45A3A266C78966CE7F4531FD06@G9W0750.americas.hpqcorp.net>
Message-ID: <20140219192749.719929fa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lee,

Please keep the list Cc'ed.

On Wed, 19 Feb 2014 18:12:33 +0000, Jenkins, Lee (ISS Houston) wrote:

> Thanks for the assist. With that information and a small patch to the build of host-python I was able to build node.

Cool!

> We have talked about upgrading our buildroot. Same old tradeoff convo of time/risk to upgrade vs. our looming deadline.

Yes, indeed. Unfortunately, when calculating this tradeoff, a lot of
people/companies forget that by not upgrading, they lose community
support. And this support might prove to be very useful :)

> I could post my solution to the mailing list if you think it might be useful. I realize this wouldn't be an official patch, but it might help someone operating under similar constraints.

I don't know if it would be really useful, because it's unlikely that
people having the same problem as you will find your patch amongst the
myriad of patches that are being sent to the Buildroot mailing list :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
