From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Mar 2013 09:26:09 +0100
Subject: [Buildroot] [PATCH] Fix external toolchain gdbserver copy path
 for using buildroot-generated toolchain
In-Reply-To: <B5EF724456FFB24A8C8AE88E26CE8F4B6D7F0889@G9W0753.americas.hpqcorp.net>
References: <B5EF724456FFB24A8C8AE88E26CE8F4B6D7EAEA9@G9W0753.americas.hpqcorp.net>
 <20130320215447.0d7c272f@skate>
 <B5EF724456FFB24A8C8AE88E26CE8F4B6D7F0889@G9W0753.americas.hpqcorp.net>
Message-ID: <20130321092609.2f9e9aeb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Worth, Kevin,

On Wed, 20 Mar 2013 22:27:08 +0000, Worth, Kevin wrote:

> Thanks- I figured I could at least offer some approach to fix it, even if it wasn't ideal. :)

Sure, your investigation was very nice, it clearly showed where the
problem was.

> This approach saves me a lot of time not having to rebuild toolchains, and is relatively easy to manage.

Of course.

I'll try to remember to Cc you when I come up with a patch that fixes
this.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
