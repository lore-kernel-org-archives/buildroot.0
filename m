From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Mar 2010 16:03:21 +0100
Subject: [Buildroot] Modules architecture
In-Reply-To: <7627a87b1003030251o5313e124ofd6b99e7f0a55cc@mail.gmail.com>
References: <7627a87b1003030251o5313e124ofd6b99e7f0a55cc@mail.gmail.com>
Message-ID: <20100303160321.5ff87861@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 3 Mar 2010 13:51:05 +0300
Sergey Naumov <sknaumov@gmail.com> wrote:

> There is a problem with kernel building when .config contains
> processor architecture that differs from BR2_ARCH. Then kernel will
> have architecture as in BR2_ARCH and modules as in .config.
> Expectable behavior is to apply BR2_ARCH to both of them, or ignore
> it.
> 
> As a result of the current implementation I got "invalid module
> format" for all modules compiled with the kernel.
> 
> What should I do to avoid it "through buildroot configs", but not
> through changing architecture in kernel config?

Could you give a specific configuration example with which you have
problem ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
