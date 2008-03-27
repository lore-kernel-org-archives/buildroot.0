From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 27 Mar 2008 06:14:17 +0100
Subject: [Buildroot] using of local dir
References: <47EA8F05.8090102@gmx.net>
	<20080326180926.GA404@mx.loc><877ifp1bzg.fsf@macbook.be.48ers.dk>
	<20080327025740.GB5036@cloud.net.au>
Message-ID: <006901c88fc9$c232b280$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Wed, Mar 26, 2008 at 09:12:03PM +0100, Peter Korsgaard wrote:
>> Well, the local/save/getconfig stuff does seem kinda overengineered -
>> Couldn't we just have a bunch of *_defconfig files under configs/
>> instead with a make %_defconfig target like the kernel has instead?
> 
> As long as you can have several projects built within the same tree. I'm
> using the projects functionality to have several related projects built
> this way.
> 

That is its intended use.

> Mind you I don't like using getconfig/saveconfig; too prone to losing
> changes if you forget to saveconfig. Instead I use "make BOARD=xyz .."
> each time. I will sometime send some patches to improve this method.
> 

The stuff is used to generate the files needed by "make BOARD=xyz"
If you have no need to change the configs after that,then
you can use the BOARD=xyz after that.
Once you think it is frozen, you can submit a new board.

What do you want to change?

> Hamish
> -- 
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
> _______________________________________________




Best Regards
Ulf Samuelsson
