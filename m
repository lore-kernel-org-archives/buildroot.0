From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jul 2010 18:47:57 +0200
Subject: [Buildroot] [git commit master 1/1] qt: fix mysql dependency
 and disable unavailable sql drivers
In-Reply-To: <20100716215737.0F39682A80@busybox.osuosl.org>
References: <20100716215737.0F39682A80@busybox.osuosl.org>
Message-ID: <20100718184757.01b055f8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Jul 2010 23:55:30 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> We don't have the needed dependencies in BR for most of the SQL
> drivers, so mark those options as broken.

I had already sent a fix for the Qt->MySQL dependency on Friday, at
11:18 AM, together with a bump of the MySQL version (which allows MySQL
to actually build here) and other fixes as well.

I will rebase my changes on top of yours and resend.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
