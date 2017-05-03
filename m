From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 May 2017 15:02:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-04-29
In-Reply-To: <20170503124713.GA17301@shattrath>
References: <20170430062822.F06D82097E@mail.free-electrons.com>
 <20170503102922.GB26389@argentina>
 <20170503142939.3fc6a470@free-electrons.com>
 <20170503124713.GA17301@shattrath>
Message-ID: <20170503150243.72d66fb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 May 2017 14:47:13 +0200, Richard Braun wrote:

> > Richard have you updated your autobuild-run script recently?  
> 
> My builder should be running with version 6986aa15ed966e16312ebaef1a47f498ca76a197.
> 
> It is automatically updated and restarted once a week.

Then you are running with the latest changes from Arnout, and most of
the other autobuilder slaves are not, which is why we only see this
issue coming from your autobuilder.

So, this confirms my hypothesis that the bug is in the changes from
Arnout :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
