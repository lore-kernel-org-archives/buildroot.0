From: steve at c2root.be <steve@c2root.be>
Date: Tue, 10 Feb 2009 11:29:01 +0100
Subject: [Buildroot] rebuilding with new option
Message-ID: <20090210112901.kwbh1totokgkwcc8@webmail.digibel.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have noticed that when I change options after a build in the  
toolchain, it does not recompile. I have added large file support  
afterwards and still further down the build it is complaining I don't  
have large file support. When I double check the config, it states  
that it should have large file support.


The only thing I can do is remove buildroot_i686 folder


How can I bypass this?

kind regards

Steve

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
