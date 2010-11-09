From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Nov 2010 18:39:36 +0100
Subject: [Buildroot] Buildroot Patches I Use [3] - ldconfig -N opt
In-Reply-To: <1289317856.30565.115.camel@tr-pentomino>
References: <1289317856.30565.115.camel@tr-pentomino>
Message-ID: <20101109183936.41a980a0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 09 Nov 2010 07:50:56 -0800
Darcy Watkins <dwatkins@tranzeo.com> wrote:

> This instructs the ldconfig not to build / rebuild the cache.  It was
> a while back I encountered this and I have just carried it forward
> since. Someone more expert should check this and decide on its
> appropriateness for 2010.11 and/or future buildroot release.

Well all the point of calling ldconfig at this point is to create this
cache. So if we add -N to disable the cache build, what's the point of
calling ldconfig at all ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
