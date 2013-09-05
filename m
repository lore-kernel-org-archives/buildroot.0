From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 10:28:36 +0200
Subject: [Buildroot] More patches to apply
In-Reply-To: <CAAXf6LXw9gPrdwG+g81XH15V3MXe4HBj5timyVQPPS3k2p43ow@mail.gmail.com>
References: <CAAXf6LXw9gPrdwG+g81XH15V3MXe4HBj5timyVQPPS3k2p43ow@mail.gmail.com>
Message-ID: <20130905102836.11cc9d4d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 5 Sep 2013 10:04:46 +0200, Thomas De Schampheleire wrote:

> I think following patches can be applied now:
> 
> http://patchwork.ozlabs.org/patch/272175/
> (build reprod. in make 3.82: I think there is consensus on the part
> the patch addresses; how we will continue to check for missing
> dependencies is not yet clear but this does not block the patch from
> being applied)
> 
> http://patchwork.ozlabs.org/patch/264231/
> http://patchwork.ozlabs.org/patch/264232/
> suitable-extractor + host-xzcat
> 
> http://patchwork.ozlabs.org/patch/243427/
> plain URL in FOO_PATCH
> 
> http://patchwork.ozlabs.org/patch/272711/
> flex and bison dependencies in perf

Agreed for all of those patches.

> Following patches in patchwork are superseded:
> http://patchwork.ozlabs.org/patch/271170/
> http://patchwork.ozlabs.org/patch/272589/

Marked as such, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
