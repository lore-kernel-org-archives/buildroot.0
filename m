From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Aug 2011 15:34:23 +0200
Subject: [Buildroot] no core dumps
In-Reply-To: <1314692362.2640.144.camel@jr-ThinkCentre-A57>
References: <1314692362.2640.144.camel@jr-ThinkCentre-A57>
Message-ID: <20110830153423.2dce09c8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 30 Aug 2011 10:19:22 +0200,
J?rg Rebenstorf <Joerg.Rebenstorf@GiN.de> a ?crit :

> I am using buildroot-2009.11.
> 
> I'd like to know how to enable the linux core dump feature in
> buildroot. I have written a program that intentionally makes a
> segfault but still I get no core dump file. Is there something
> special with buildroot here? Do I need to activate a specific build
> option? As you can see below I already enabled core dumps with the
> 'ulimit' command.

Do you have ELF core dumps enabled in your kernel configuration?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
