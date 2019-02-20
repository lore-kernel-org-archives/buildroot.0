From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 20 Feb 2019 18:32:06 +0200
Subject: [Buildroot] 2019.02-rc1 doesn't boot properly
Message-ID: <20190220163206.GB9224@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Recently I had tried to boot 2019-02.rc1 on my Intel Edison board (after few
iterations I confirm that the issue somewhere in Buildroot,
since 2018.11.x works with the same configuration), but it went unsuccessfully.

It's a bit hard for me and time consuming to debug right now, though here are
the symptoms. Since I have SSH and network enabled it looks like ssh-keygen
goes to endless wait for entropy / random generator (?) and never becomes back
that prevents to have a shell. Everything from kernel till daemons and modules
works. (I have USB OTG enabled and I see dmesg when I switched USB roles).

Is it known issue?

-- 
With Best Regards,
Andy Shevchenko
