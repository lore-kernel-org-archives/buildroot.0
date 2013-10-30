From: Christophe Vu-Brugier <cvubrugier@lacie.com>
Date: Wed, 30 Oct 2013 09:14:16 +0100
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131030011250.65f01b8d@skate>
References: <20131029204108.5d707d09@skate> <20131029234103.GA2527@localhost>
 <20131030011250.65f01b8d@skate>
Message-ID: <20131030091416.16020070@grp-cvubrugier.lacie.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 30 Oct 2013 01:12:50 +0100, Thomas Petazzoni wrote :
> > As a side note, wouldn't it be nice to have per-arch-filtering in the
> > autobuild status site? Going through the code quickly, I think it's just
> > a matter of adding a parameter to the SQL query, right?
> 
> It wasn't implemented until I received your e-mail, but it's now done.
> Enjoy:
> 
>    http://autobuild.buildroot.org/?arch=nios2
>    http://autobuild.buildroot.org/?arch=nios2&status=OK
>    http://autobuild.buildroot.org/?arch=nios2&status=NOK

Great!

It seems that filtering by architecture does not work for x86_64. The
following URL displays build statuses of all architectures, not only
x86_64:

  http://autobuild.buildroot.org/?arch=x86_64

Best regards,

-- 
Christophe Vu-Brugier
