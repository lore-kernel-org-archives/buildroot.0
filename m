From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 4 Apr 2012 08:33:16 -0700
Subject: [Buildroot] udhcpc when link is up
Message-ID: <CALo-6+g53Ay8J7QNLhfys8Sc7C_U9hd_CQAWm2T1r0vt7KcMdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have another noob question concerning dhcp this time.

I observer with our MPC8323 system that if the system is booted with
the network cable disconnected and after boot the cable is connected,
I get the proper "Link is Up" message, but dhcp does not request a
lease.

If I run "udhcpc", the network is then setup properly, but I would
like "Link is Up:" to trigger udhcpc. I do not see a script in
/etc/udhcpc/default.script.

Can someone point this "noob for the day" in an appropriate direction
to understand how to cause "Link is Up" to properly obtain a lease,
please?

-- 
Charles Krinke
