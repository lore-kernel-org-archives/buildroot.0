From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Sep 2013 09:54:35 +0200
Subject: [Buildroot] PowerPC Build Problem
In-Reply-To: <52268480.1000606@rftechnology.com.au>
References: <52268480.1000606@rftechnology.com.au>
Message-ID: <20130904095435.2c1c78fc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jason Rennie,

On Wed, 04 Sep 2013 10:53:20 +1000, Jason Rennie wrote:

> I apologise if the question is inappropriate for this list but I know 
> everyone here is knowledgeable and you were very helpful last time
> when I was having problems getting things to start and it turned out
> to be an issue with the device tree.
> 
> I'm using buildroot to build for an APC8272ADS chip with Intel/Sharp 
> Memory chips on board. That build of the kernel does appear to work 
> correctly the relevant portion is

[...]

> But when I try building it with the latest buildroot (2013.08) and I 
> configure the kernel (3.10.10) I get one of two things. If I don't 
> include specific settings to physmap then I get a kernel panic when
> it can't mount the root filesystem as follows

From what you're telling us, it really looks like a kernel problem
(either a configuration one, or a real problem in the kernel code).
Since you're able to use a recent version of the kernel (3.10), it
means that you can easily benefit from support from the kernel
community. I would therefore recommend you to get in touch with the
PowerPC kernel developers doing the support for this board/SoC and
asking the question there.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
