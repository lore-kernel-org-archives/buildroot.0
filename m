From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jan 2013 00:00:53 +0100
Subject: [Buildroot] root.fs tar fails on 2012.11 and 2013.x from today
In-Reply-To: <CAG6aBkUKBBWJPAmQaP_scR4-7o=uLuu69vdp0nANVuoDhRnQCg@mail.gmail.com>
References: <CAG6aBkUKBBWJPAmQaP_scR4-7o=uLuu69vdp0nANVuoDhRnQCg@mail.gmail.com>
Message-ID: <20130119000053.3f7eebc1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nigel Sollars,

On Fri, 18 Jan 2013 16:03:43 -0500, Nigel Sollars wrote:

> Something odd for sure, I took a look on the interwebs and made sure all
> was well with my selections.
> 
> Basically whats happening is it seems that target/generic/device_table.txt
> is not getting created the build / final then errors with a No such file or
> directory.

This file has changed location, it is now in system/device_table.txt.
It might be that your configuration file still references the file in
its old location. Could you check this?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
