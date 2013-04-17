From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Apr 2013 17:36:56 +0200
Subject: [Buildroot] I: Configure buildroot for xen
In-Reply-To: <1366212821.63063.YahooMailClassic@web171902.mail.ir2.yahoo.com>
References: <20130417110236.054b83b0@skate>
 <1366212821.63063.YahooMailClassic@web171902.mail.ir2.yahoo.com>
Message-ID: <20130417173656.712a8926@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luisa Posani,

On Wed, 17 Apr 2013 16:33:41 +0100 (BST), Luisa Posani wrote:

> After so much suffering I was able to start the virtual machine by mounting the disk xvda1.
> I have a problem, however, when in the inittab file is set to respawn the getty.
> 
> You do not see more traces.
> 
> What kind of console I have to give?

Probably some Xen specific console, I don't know which device it is.
Once you figure it out, set the BR2_TARGET_GENERIC_GETTY_PORT option to
it.

Also, it would be good if you could at the end share your configuration
file as well as the procedure you've used to test it under Xen. It may
be useful for other persons.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
