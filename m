From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 7 Jul 2007 13:16:13 +0200
Subject: [Buildroot] What is the proper procedure to commit a patch?
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
	<20070706152642.GA13765@aon.at>
	<012f01c7bfe3$f55fb4c0$dcc4af0a@atmel.com>
	<20070707101217.GO4096@aon.at>
Message-ID: <00c201c7c091$e527cc10$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>Now we have package/linux.mk and we have Linux configuration spread out.
>>
>>What I want to do is to move "package/linux.mk" to "package/linux/linux.mk"
> 
> What's that good for? Just curious, this is just cosmetics.
> 
>>and then remove the distributed linux configuration to "package/linux/Config.in"
> 
> Which "distributed linux configuration" do you mean?
>

I'd like to have the configuration and makefile in the same directory.
Now the configuration is in a different directory.

The current linux.mk is much less flexible than the one I use.
Once we have the linux in a good place, then I will submit
my proposals to the mailing list.

Best Regards
Ulf Samuelsson
