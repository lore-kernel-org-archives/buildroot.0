From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 10:05:49 +0200
Subject: [Buildroot] [PATCH] i7z: new package
In-Reply-To: <20160427073907.GA6060@jazz.nc.intel.com>
References: <1461680504-21604-1-git-send-email-vincent.stehle@intel.com>
 <t3c4vcxq7g.ln2@ID-313208.user.individual.net>
 <20160427073907.GA6060@jazz.nc.intel.com>
Message-ID: <20160427100549.1ae1aa33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Apr 2016 09:39:08 +0200, Vincent Stehl? wrote:
> On Tue, Apr 26, 2016 at 04:55:25PM +0200, Bernd Kuhls wrote:
> > > +	  https://code.google.com/archive/p/i7z/
> > this link runs into a 404 error:
> 
> Hi Bernd,
> 
> Thanks for trying. This 404 error is strange as it "works for me".

I can confirm that https://code.google.com/archive/p/i7z/ works for me
as well.

> Anyway, I will link to github as you proposed in case that helps. The github
> project has a link to the google code page anyway.

Yes, the Google Code site is just an archive, it is no longer evolving.
If the development has moved to Github, then you should use the Github
page as the upstream URL in Config.in.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
