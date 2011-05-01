From: Heiko Zuerker <heiko@zuerker.org>
Date: Sun, 01 May 2011 07:48:08 -0500
Subject: [Buildroot] mysql server and stack direction
Message-ID: <20110501074808.87796h8v1x8gb3k8@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm working on the MySQL server package (v5.1 done, v5.5 will be  
next), but one of the issues is that it needs the "stack direction"  
set before the compile.

Does anybody have an idea how this can be configured dynamically? I'd  
really hate to have to make this a config option.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
