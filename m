From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Mar 2012 08:00:21 +0100
Subject: [Buildroot] core file
In-Reply-To: <DC8F7388218A402C9FEADA4D9CC577B3@JohanW7>
References: <DC8F7388218A402C9FEADA4D9CC577B3@JohanW7>
Message-ID: <20120315080021.24349b77@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the Buildroot list in the loop.

Le Thu, 15 Mar 2012 03:02:29 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> I have the core file  and gdb on the target.
>  
> What should i do with it, i never used gdb on the command line so far.

If you have gdb on the target, then:

gdb /usr/bin/curl -c /path/to/the/core/file

By the way, if you are using BR2_CCACHE, then please disable it and do
a complete rebuild to see if it works better.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
