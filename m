From: steve at fl-eng.com <steve@fl-eng.com>
Date: Fri, 22 Aug 2008 21:16:36 -0500
Subject: [Buildroot] ### ARM11 Buildroot for MX31
Message-ID: <6gvfio$77k560@rrcs-agw-01b.hrndva.rr.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I have downloaded the buildroot package and have built it for the ARM11 
MX31 processor from Freescale. It is running with kernel 2.6.22

Everything compiles and loads up, I can get a login prompt for 
username/password from the filesystem produced by buildroot.

However, I cannot seem to login. I assumed that the login would be "root" 
and no password. I looked into the /etc/passwd and /etc/shadow files which 
seemed to confirm that perhaps root(nopassword) and maybe user(user) was 
also a login. 

Can anyone provide some suggestions on what the login should be and, 
ideally, how to reset it during the filesystem generation?

THe other thing I tried to do was pass init=/dev/sh and init=/dev/bash to try 
to get a direct shell prompt. I don't think it was connecting to the MX31's 
serial port because I never saw any outputs after the filesystem was 
mounted. Is there a recommended way to force /dev/sh to appear on a ttyS0 
(or actually ttymxc0 for the MX31)

Thank you

Steve Spano
