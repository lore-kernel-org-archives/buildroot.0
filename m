From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Oct 2012 20:18:03 +0200
Subject: [Buildroot] buildroot for AM3358 AM3359 with wireless-tools
 shared library
In-Reply-To: <50897A02.7000407@rie.eu>
References: <50897A02.7000407@rie.eu>
Message-ID: <20121025201803.301aa50a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Stieler,

On Thu, 25 Oct 2012 19:42:26 +0200, Michael Stieler wrote:

> we are using buildroot for arm development. we are migrating from 
> arm926t to AM3358 and AM3359.
> 
> i was hoping to continue to use buildroot for the processors, but i 
> cannot build the right compiler for these 2.
> 
> in make menuconfig i choose:
> 
> target architecture ARM (big endian)
> target architecture variant cortex-a8        # for sitara am3358
> cortex a8 ? toolchain ->  Kernel headers 3.2.x
> package selection for target -> network applications --> X wireless 
> tools --> X install shared library

Please send a .config, a vague explanation about your configurations is
not sufficient for us to understand what you've done.

> i need the wireless tools library. liw
> 
> any suggestions ?

Sorry, but you're not explaining what your problem is. What are you
trying to achieve?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
