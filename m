From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Oct 2012 08:29:03 +0200
Subject: [Buildroot] Buildroot Issue with a uImage build
In-Reply-To: <506F5266.9030305@mind.be>
References: <7D8DC74DEB12384E8E4F5EE4879A8497401F03B5@USMANSMEXPW01>
 <506F5266.9030305@mind.be>
Message-ID: <20121009082903.43cd878a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 05 Oct 2012 23:34:30 +0200, Arnout Vandecappelle wrote:

> > When I built this - the associated Kernel uImage was HUGE (60Meg)?
> 
>   Something funny going on there...  I built the current master with
> the nitrogen6x_defconfig and the uImage is only 3.7M.
> 
>   Maybe check the linux config, did it accidentally turn into an
> allyesconfig?

Or, maybe you have enabled an initramfs, and have enabled a number of
packages. Could you please put your Buildroot .config file and
kernel .config file on some pastebin site and post the URLs here?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
