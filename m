From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 10:26:56 +0200
Subject: [Buildroot] Stupid n00b question about U-Boot config
In-Reply-To: <817F82FC-C333-4BC2-9BD9-4ADBB6D313BC@nasa.gov>
References: <817F82FC-C333-4BC2-9BD9-4ADBB6D313BC@nasa.gov>
Message-ID: <20120822102656.5c528851@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 21 Aug 2012 18:41:43 -0500,
"Fry, Charles R. {Chuck}(ARC-TI)[Stinger Ghaffarian Technologies Inc.
(SGT Inc.)]" <chuck.fry@nasa.gov> a ?crit :

> make[1]: Entering directory `/home/cfry/buildroot/buildroot-2012.05/output/build/uboot-2012.04.01'
> make: *** No rule to make target `at91sam9260ek_config'.  Stop.

U-Boot does not have a at91sam9260ek configuration. The available
configuration for this board are:

  at91sam9260ek_dataflash_cs0
  at91sam9260ek_dataflash_cs1
  at91sam9260ek_nandflash

see boards.cfg in U-Boot source code for the list of available
configurations.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
