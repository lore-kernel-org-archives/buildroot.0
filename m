From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 22 Mar 2007 14:53:12 +0100
Subject: [Buildroot] BSP patch
References: <02a401c76c07$c75473c0$01c4af0a@Glamdring>
	<20070321224324.GD5468@aon.at>
	<02e801c76c0e$c9eec980$01c4af0a@Glamdring>
	<20070322132609.GA11410@aon.at>
Message-ID: <01a101c76c8a$2450a4e0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>The BSP patch also put some structure on where the result ends up.
>>Today everything is stored in the top directory, but if you
>>want to build multiple boards, then you are going to get a lot of clutter.
>
> We need to better differentiate between arch and cpu (generally, not in
> your board support patch).
>
> Applying your patch now locally. Let's see..
>

Thank You,

So far the patch does not create anything, only defines locations.

The beef is in the patches that follows
but I plan to submit the AVR32 toolset patches first.

The idea is to avoid keeping the toolset patches
inside the buildroot,and instead download the patches
before they are applied.

Best Regards
Ulf Samuelsson
