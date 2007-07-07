From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 7 Jul 2007 14:35:36 +0200
Subject: [Buildroot] What is the proper procedure to commit a patch?
In-Reply-To: <00c201c7c091$e527cc10$dcc4af0a@atmel.com>
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
	<20070706152642.GA13765@aon.at>
	<012f01c7bfe3$f55fb4c0$dcc4af0a@atmel.com>
	<20070707101217.GO4096@aon.at>
	<00c201c7c091$e527cc10$dcc4af0a@atmel.com>
Message-ID: <20070707123536.GS4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 07, 2007 at 01:16:13PM +0200, Ulf Samuelsson wrote:
>>>Now we have package/linux.mk and we have Linux configuration spread out.
>>>
>>>What I want to do is to move "package/linux.mk" to "package/linux/linux.mk"
>> 
>> What's that good for? Just curious, this is just cosmetics.
>> 
>>>and then remove the distributed linux configuration to "package/linux/Config.in"
>> 
>> Which "distributed linux configuration" do you mean?
>>
>
>I'd like to have the configuration and makefile in the same directory.

I don't like to have it in the same directory.

>Now the configuration is in a different directory.

Yes, and that's a feature. You (or the board) can easily set
BR2_PACKAGE_LINUX_KCONFIG to anything you want. It was added for exactly
this purpose.

>
>The current linux.mk is much less flexible than the one I use.

You keep saying this, ISTR.
What does not work currently as opposed to "yours"?

Did you try to use the currently existing one, recently?

>Once we have the linux in a good place, then I will submit
>my proposals to the mailing list.
