From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jun 2013 18:33:25 +0200
Subject: [Buildroot] [RFC] ti-gfx: add new package
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB48108@DBDE04.ent.ti.com>
References: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
 <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
 <51B9F82B.8030203@mind.be>
 <321768C95D21724485BCE784F1BE98473EB48108@DBDE04.ent.ti.com>
Message-ID: <20130615183325.2fb03b6c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sundareson, Prabindh,

On Fri, 14 Jun 2013 02:20:12 +0000, Sundareson, Prabindh wrote:

> 2. devmem2 is used for querying the version of the SGX core at runtime to do the right initialization
> 
> > +	select BR2_PACKAGE_DEVMEM2
> >>  Why is this needed?

So in this case, there should be a comment "# Runtime dependency" right
before the "select BR2_PACKAGE_DEVMEM2".

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
