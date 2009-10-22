From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Oct 2009 21:26:24 +0200
Subject: [Buildroot] RT-Linux ucLibc or glibc?
In-Reply-To: <B44D4D5BF344094DABB900C4E0F6E3533945A36BC5@srv02.nortechonline.net>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A36BC5@srv02.nortechonline.net>
Message-ID: <20091022212624.3dbe24ee@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Oct 2009 15:56:47 +0100,
"Hodgson, Simon" <Simon.Hodgson@nortechonline.co.uk> a ?crit :

> We're building a system, and want to  make use of the RT-Preempt
> Kernel patch.
> 
> My question is, do we need to use glibc, or will uClibc be OK?
> 
> This wiki page suggests that some of the features required are not
> present in uclibc
> (http://rt.wiki.kernel.org/index.php/HOWTO:_Build_an_RT-application)
> but it was written some time ago.
> 
> Just wondered if anyone has any experience of this?

Last time I looked, it was still the case. Things like
priority-inheritance mutexes for example were not supported.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
