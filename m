From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jun 2009 15:58:14 +0200
Subject: [Buildroot] Thumb instruction set setting for buildroot-v23434
In-Reply-To: <097e01c9e2a8$bee21340$a90a0a0a@ansonlam>
References: <097e01c9e2a8$bee21340$a90a0a0a@ansonlam>
Message-ID: <20090601155814.7d6fc3b9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 1 Jun 2009 19:04:34 +0800,
"Anson Lam" <anson.lam@outline.com.hk> a ?crit :

>   I use 16-bit SDRAM for AT91SAM9260.  I downloaded the
> buildroot-v23434.  I want to use Thumb High Code Density 16-bit
> Instruction Set in my system.  I need to configure SDRAM in 16-bit
> and compile the code in thumb instruction set.  However, I cannot
> find any setting in menuconfig for compiling the code in 16-bit thumb
> instruction set.  Do you have any suggest?  Thanks for your reply.

More than one year ago I worked on a simple patch to include Thumb
support in Buildroot. It hasn't been included so far, but can be a
starting point if you're interested.

See http://lists.busybox.net/pipermail/buildroot/2008-March/019622.html

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
