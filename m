From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 22:28:23 +0100
Subject: [Buildroot] [PATCH v2 04/15] fs/tar: make results reproducible
In-Reply-To: <b762049e2698fa9e52f43abd5571d6a2@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-5-git-send-email-jezz@sysmic.org>
 <20161118124008.2b7a3178@free-electrons.com>
 <28c618b1c91a0df16af32645666e7198@sysmic.org>
 <20161118142945.60adccd8@free-electrons.com>
 <b762049e2698fa9e52f43abd5571d6a2@sysmic.org>
Message-ID: <20161118222823.155c12a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 14:44:50 +0100, J?r?me Pouiller wrote:

> > Yes, I know, but it's a pain to force everyone using an old distro to
> > build host-tar. Maybe we should make this conditional on
> > BR2_REPRODUCIBLE?  
> 
> Last Ubuntu LTS is 16.04 and Debian 9 will be stable in a few months 
> (maybe simultaneous with next Buildroot version).
> 
> So, IMHO it not justified to add a dirty condition in check-host-tar.sh.

I think you don't really realize how big companies work. They will be
using such version in 3 or 5 years maybe.

We have people still using RHEL5, even though it's almost 10 years old,
and its support going to stop next year. Supporting old distributions
is important for Buildroot, so you can't just sweep away the problem by
pretending that it doesn't exist with modern distributions.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
