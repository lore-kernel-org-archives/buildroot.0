From: Ram kumar <ramkumar.research@gmail.com>
Date: Thu, 26 Jun 2008 11:23:02 -0700
Subject: [Buildroot] ping illegal instruction error in buidroot with busybox
Message-ID: <6306c640806261123n4ad6528coca849ed20662d29b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,
         I have built the filesystem with buildroot snapshot.When i connect
my arm AT91SAM9260 target and type a ping command in the console it says
illegal instruction.My ifconfig,modprobe,hostname all are working fine.But
iam not able to use ping command.

I have enabled floating point support in my kernel.

#
# Floating point emulation
#

#
# At least one emulation must be selected
#
CONFIG_FPE_NWFPE=y
# CONFIG_FPE_NWFPE_XP is not set
# CONFIG_FPE_FASTFPE is not set
# CONFIG_VFP is not set

The ping command did not work for both EABI and OABI configuration.

Please guide me to solve the issue ?

Regards,
Ram
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080626/8a204153/attachment.htm 
