From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 14 Sep 2011 15:39:38 +0200
Subject: [Buildroot] [PATCH 0 of 2 v2] Add Xenomai real-time framework
In-Reply-To: <patchbomb.1316004973@localhost6.localdomain6>
References: <patchbomb.1316004973@localhost6.localdomain6>
Message-ID: <1316007581.8685.6.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-09-14 at 14:56 +0200, Thomas De Schampheleire wrote:
> These two patches are an initial add for Xenomai in buildroot.
> 
> "Xenomai is a real-time development framework cooperating with the
> Linux kernel, in order to provide a pervasive, interface-agnostic,
> hard real-time support to user-space applications, seamlessly
> integrated into the GNU/Linux environment."
> [http://www.xenomai.org]

Can we also add the RT-PREEMPT kernel patch as such a kernel extension?
I have successfully tried the 3.0.1-rt patch in buildroot a while ago
and as far as I can see there is now a patch for 3.0.4 (3.0.4-rt13). It
should be available from here (if kernel.org wasn't down):

 http://www.kernel.org/pub/linux/kernel/projects/rt/

It would probably make sense to include the option to download and use
this patch in the new menu. There are some changes to the kernel
configuration necessary as well, as explained here:

 http://rt.wiki.kernel.org/index.php/RT_PREEMPT_HOWTO

Would there be interest to add this? We are not actually using this, so
I am not sure if I could find the time to prepare the necessary changes.
But having this available in buildroot might make it easier for us and
other to experiment with the RT-PREEMPT kernel.


Regards,
Sven
