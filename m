From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Tue, 01 Jun 2010 20:21:26 +1000
Subject: [Buildroot] Buildroot 2010.05-rc3 released
In-Reply-To: <201005282220.50730.yann.morin.1998@anciens.enib.fr>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<201005272315.11295.yann.morin.1998@anciens.enib.fr>
	<1274997359.436.32.camel@ubuntu>
	<201005282220.50730.yann.morin.1998@anciens.enib.fr>
Message-ID: <1275387686.1624.4.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann et al,

On Fri, 2010-05-28 at 22:20 +0200, Yann E. MORIN wrote:
> Kris, All,
> 
> On Thursday 27 May 2010 23:55:59 Microbit_Ubuntu wrote:
> > On Thu, 2010-05-27 at 23:15 +0200, Yann E. MORIN wrote:
> > > libthread_db.so.1 is dlopen(3)ed by gdbserver, so you have to get it on
> > > your target, in the standard libraries search path.
> > When gdbserver was bleating about libthread_db.so.1, it was in the staging directory,
> > but it wasn't placed on the target rootfs.
> > When I manually added it on the target (libthread_db.so.1 I mean), gdbserver worked good as gold then...
> 
> I've just submitted a fix for this:
>   http://lists.busybox.net/pipermail/buildroot/2010-May/034848.html
> 
> Care to test it and report, please?
> 
> Regards,
> Yann E. MORIN.
> 


Sorry for brief delay.
Have my feet back under desk now. Need to do some fiddling on XP first,
but then back to Linux.
I noticed that 2010.05 is fully released now, so I'll start from there.
I'm not sure if your fix is in 2010.05 final or not, but I guess we'll
see shortly.
I will delete 2010.05-rc3 folder and rebuild with 2010.05 final and go
from there. Will keep you posted.

Thanks for reviewing !

Best regards,
Kris
