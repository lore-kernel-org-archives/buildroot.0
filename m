From: Heiko Zuerker <heiko@zuerker.org>
Date: Thu, 23 Dec 2010 07:33:18 -0600
Subject: [Buildroot] busybox, hardcoded config
Message-ID: <20101223073318.154656bz82tuap44@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

there was recently a discussion on the topic of automatically turning  
on specific kernel features, which can cause some problems.

This is very heavily done in busybox, i.e. nfs support for mount keeps  
being turned on by the makefile. At least in my case this is causing  
me some grief.

I think we really should keep this automatically setting of  
configurations to an absolute minimum. Can't we rely on the person  
configuring buildroot, to set the correct options he or she needs for  
example in busybox or the kernel?

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
