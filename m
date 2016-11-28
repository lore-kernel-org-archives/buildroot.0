From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 22:13:39 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: bump version to
 v4.1-2345 and fix version reporting
In-Reply-To: <8D43E2E0-8E99-4D96-8323-E1F360077FD4@gmail.com>
References: <20161128103231.21626-1-damjan.marion@gmail.com>
 <20161128220315.1924903c@free-electrons.com>
 <8D43E2E0-8E99-4D96-8323-E1F360077FD4@gmail.com>
Message-ID: <20161128221339.564e219f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 22:08:04 +0100, Damjan Marion wrote:

> > Could you split the bump and the version fix reporting in two separate
> > patches?  
> 
> ack

Thanks!

> >> -TVHEADEND_VERSION = 50a370707aedf5c127e92bb517c378aa8ac04657
> >> +TVHEADEND_VERSION = v4.1-2345-g04ff649  
> > 
> > Please keep this as a full hash, like it used to be. It should still  
> 
> May I ask for reason? Just for my curiosity...

Because we're using a full hash in every other package fetched from Git
in Buildroot, and we like consistency :)

> > work fine with the version reporting, if you write this version to
> > $(@D)/rpm/version, like you're doing below.  
> 
> Are you suggesting here that tvheadend about page should just report 
> ?50a370707aedf5c127e92bb517c378aa8ac04657? as a version?

Yes, exactly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
