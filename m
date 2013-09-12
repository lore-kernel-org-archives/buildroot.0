From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 09:17:04 +0200
Subject: [Buildroot] [PATCH 05/17] checkpolicy: new package
In-Reply-To: <52309DD8.3080506@mind.be>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378336196-27403-6-git-send-email-clshotwe@rockwellcollins.com>
 <20130906195609.237ba6d0@skate>
 <OFC0C68881.BE62946A-ON86257BE1.005F39EC-86257BE1.00606A14@rockwellcollins.com>
 <52309DD8.3080506@mind.be>
Message-ID: <20130912091704.3bb27460@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 11 Sep 2013 18:44:08 +0200, Arnout Vandecappelle wrote:

>   Note: you'll probably want to add a Config.in.host for this
> package, so people can select it in their config and use it in a
> post-build script.
> 
>   In the long term, it is probably also a good idea to have a 
> system-level SELinux menu where you can specify some policy files to
> be put on the target, and buildroot will compile and install them for
> you.

I agree. Usage of SELinux is such a system-wide thing that we might
need an entry for it in the "System configuration" menu for example.

But well, let's get the packages merged first, and we'll work together
to see how to polish the integration.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
