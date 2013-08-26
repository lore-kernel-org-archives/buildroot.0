From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 26 Aug 2013 15:21:27 -0700
Subject: [Buildroot] Searching for some advice
Message-ID: <CALo-6+ijsQKnSsHOecR6P5juBBucDx6aogoPkLuXWrQ+yJHvBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Its my turn to be a noob today.

I have a powerpc design using the mpc832x_rdb that is currently
2.6.35.12 and I am trying to test compile 2.6.39 and am hung up in a
freeze right after the dtb is loaded.

I am searching for an opinion or two on:

a) What are the things most likely to cause a freeze after loading dtb
between a 2.6.35.12 kernel and 2.6.39 where the dtb has not changed
and

b) Is there any way to debug the kernel when it freezes after loading
the dtb other then admire it when it freezes.

-- 
Charles Krinke
