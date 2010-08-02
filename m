From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Aug 2010 17:14:01 +0200
Subject: [Buildroot] Correct way to check for clock_gettime()
In-Reply-To: <20100802051736.GC30548@gmx.de>
References: <20100730135118.45adcc67@surf>
	<AANLkTi=7t2kQXj96nktqEd=T3zDOvBXQDrjXW+u7FpG0@mail.gmail.com>
	<20100802033353.281d9bc8@surf> <20100802051736.GC30548@gmx.de>
Message-ID: <20100802171401.7b9809de@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ralf,

Thanks a lot for your feedback!

On Mon, 2 Aug 2010 07:17:36 +0200
Ralf Wildenhues <Ralf.Wildenhues@gmx.de> wrote:

> * Thomas Petazzoni wrote on Mon, Aug 02, 2010 at 03:33:53AM CEST:
> > So the ability of sharing the cache between execution of
> > different configure scripts is a documented feature. Is it just
> > that in reality it doesn't work that well ?
> 
> You should be able to modify both configure scripts in a way so that
> it works again; and in this particular example it should be done.
> Getting this approach to scale can be a lot of work though.

Is this approach "officially" supported by autoconf ? If I fix one of
the configure.{in,ac} script and try to get the change merged upstream,
it's an important argument to know if the change is done to comply with
a general rule of configure.{in,ac} and not a specific hack.

Moreover, as Steffen asked later in the thread, in the particular case
I've presented in the original mail of this thread, what would be the
correct fix ?

I have also other cases of configure cache misuse by two independent
packages. I'm often able to track down the cause of the problem, but
I'm not autoconf-ed enough to know which is the correct fix. May I
present those other cases to the list ?

Thanks again for your inputs,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
