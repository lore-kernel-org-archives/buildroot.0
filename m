From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jun 2013 19:41:41 +0200
Subject: [Buildroot] Kernel download problem.
In-Reply-To: <25A17A429F5A404F8323F087DD6980C4@JohanW7>
References: <25A17A429F5A404F8323F087DD6980C4@JohanW7>
Message-ID: <20130614194141.24ed6dee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Fri, 14 Jun 2013 12:02:44 +0200, Sagaert Johan wrote:

> There seems to be a problem with the downloading of a kernel when a longterm release is selected.
> 
> Buildroot tries 
> 
> http://www.kernel.org/pub//linux/kernel/v2.6/linux-2.6.34.14.tar.xz 
> 
> While the real kernel is at 
> https://www.kernel.org/pub/linux/kernel/v2.6/longterm/v2.6.34/linux-2.6.34.14.tar.xz
> 
> So maybe it should be copied to the buildroot sources mirror.

Could you show which Buildroot configuration exhibits the problem? From
a quick look, the only way for Buildroot to be told to use 2.6.34.14 is
by specifying a custom kernel version. And in this case, it's the user
responsibility to make sure the URL is correct. Why would we keep
2.6.34.14 in our mirror specifically and not the myriad of other kernel
versions that the user may select?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
