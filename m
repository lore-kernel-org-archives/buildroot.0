From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 15:00:13 +0200
Subject: [Buildroot] Strange error when set root password in buildroot
In-Reply-To: <CAAXf6LX1Yy4Nazpde1n1b31aYEkm53-fv8MQ=PFEPP8Nd646Dg@mail.gmail.com>
References: <20130725024203.GC391@zuhnb712.ap.bm.net>
 <CAAXf6LU==DtcLaPEiXopt6+32KH=0c4Ws7S7hjw=A183aNjP3w@mail.gmail.com>
 <20130726093118.GA16261@zuhnb712.ap.bm.net>
 <CAAXf6LXcgSMJ1v6nzVMOG=DfkWmJz8SaZm+Rzti4ENBXABKoqw@mail.gmail.com>
 <20130727054252.GA4893@zuhnb712.ap.bm.net>
 <CAAXf6LX1Yy4Nazpde1n1b31aYEkm53-fv8MQ=PFEPP8Nd646Dg@mail.gmail.com>
Message-ID: <20130727150013.6cfc3f47@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sat, 27 Jul 2013 10:00:59 +0200, Thomas De Schampheleire wrote:

> I guess it will work for you. But this is not an acceptable final solution.
> 
> Input from others would be great here.

I guess the only option would be to build our own mkpasswd and use it
when the user enters a non-empty root password in the configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
