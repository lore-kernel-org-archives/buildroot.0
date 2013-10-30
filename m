From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 09:29:09 +0100
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131030091416.16020070@grp-cvubrugier.lacie.com>
References: <20131029204108.5d707d09@skate> <20131029234103.GA2527@localhost>
 <20131030011250.65f01b8d@skate>
 <20131030091416.16020070@grp-cvubrugier.lacie.com>
Message-ID: <20131030092909.28c0b213@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Wed, 30 Oct 2013 09:14:16 +0100, Christophe Vu-Brugier wrote:

> > It wasn't implemented until I received your e-mail, but it's now
> > done. Enjoy:
> > 
> >    http://autobuild.buildroot.org/?arch=nios2
> >    http://autobuild.buildroot.org/?arch=nios2&status=OK
> >    http://autobuild.buildroot.org/?arch=nios2&status=NOK
> 
> Great!
> 
> It seems that filtering by architecture does not work for x86_64. The
> following URL displays build statuses of all architectures, not only
> x86_64:
> 
>   http://autobuild.buildroot.org/?arch=x86_64

Thanks for noticing. I've fixed that now, by committing:

  http://git.buildroot.net/buildroot-test/commit/?id=2a0407cbe338bd5823014a860325fa31a3a90378

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
