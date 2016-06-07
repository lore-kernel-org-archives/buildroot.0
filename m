From: Patrick Doyle <wpdster@gmail.com>
Date: Tue, 7 Jun 2016 13:44:55 -0400
Subject: [Buildroot] Resource Limits
Message-ID: <CAF_dkJCCZcXdf=G8TJ1HUA1TiCAmbE56oA6KkWMyxcLrkxgo-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks...

How are resource limits managed in buildroot generated systems?

Suppose I wanted to allow real-time priorities above zero.  How could
I enable that for an unprivledged user?

Would I have to enable pam with pam_limits.so in order to use
/etc/security/limits.conf?

Can I use sysctl?  Is that a package I can enable?

Most preferably, could I just compile the resource limits into the
kernel and not have to bother with any external packages?

Any thoughts?

--wpd
