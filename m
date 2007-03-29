From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 29 Mar 2007 12:30:43 +0200
Subject: [Buildroot] BSP patch
References: <02a401c76c07$c75473c0$01c4af0a@Glamdring>
	<20070321224324.GD5468@aon.at>
	<02e801c76c0e$c9eec980$01c4af0a@Glamdring>
	<20070322132609.GA11410@aon.at>
Message-ID: <017101c771ed$52dbe8c0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[snip]

>>The BSP patch is really there to allow two different configurations
>>to be built within the same buildroot directory so they can share:
>>
>>* toolchain
>>* root file system build directory.
>>but have different configurations for linux kernel and busybox
>>and eventually you may want to have different content of the root file
>>system.
>>
>>The solution is to create a new directory structure
>>target_build_<arch>/<board> where everything is built.
>>The patch allows pre/postfixes to this directory name.
>>
>>The BSP patch also put some structure on where the result ends up.
>>Today everything is stored in the top directory, but if you
>>want to build multiple boards, then you are going to get a lot of clutter.
>
> We need to better differentiate between arch and cpu (generally, not in
> your board support patch).
>
> Applying your patch now locally. Let's see..
>

Any progress?


Best Regards
Ulf Samuelsson
