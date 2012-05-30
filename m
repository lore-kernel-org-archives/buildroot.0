From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 May 2012 23:28:06 +0200
Subject: [Buildroot] merge windows, package submission standards,
 procedure ... ?
In-Reply-To: <87d35lxtts.fsf@macbook.be.48ers.dk>
References: <CAPOFwxoH3mJX8-tY0KvBiiyeH19VODTz+xgRMz=8-oB7q=154Q@mail.gmail.com>
 <87d35lxtts.fsf@macbook.be.48ers.dk>
Message-ID: <20120530232806.0b3365ec@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 30 May 2012 23:06:07 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

>  David> 1.   a specific merge window/timeline that patches need to be
>  David> in by in order to make it into a pending release?
> 
> Yes. We do releases every 3 months (I'll most likely release 2012.05
> tonight). After a release has been done, the tree is open for new
> features for the next 2 months, after which I put of release
> (n+1)-rc1, and no longer add any new features to the main (release)
> branch. At the same time I also create a next branch and start adding
> new feature patches for the following release. Once the release is
> out I'll merge next to the the main branch and the cycle restarts.

Which means that practically speaking, you can send your patches at any
time, without having to worry about whether a merge window is opened or
not.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
