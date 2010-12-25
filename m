From: Heiko Zuerker <heiko@zuerker.org>
Date: Sat, 25 Dec 2010 10:20:11 -0600
Subject: [Buildroot] continued issues with AR
Message-ID: <20101225102011.66586l6anzqeak0s@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

it seems like I keep running into issues where it tries to use my  
local ar, instead of the one from the external toolchain.
I'm not familiar with the workings behind the scenes of buildroot, but  
is it possible that something is missing somewhere?
Do we need to always set i.e. AR=$(TARGET_AR) ?
Could the same be happening for other files like ld,gcc and so on?

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
