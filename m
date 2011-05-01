From: Heiko Zuerker <heiko@zuerker.org>
Date: Sun, 01 May 2011 12:23:03 -0500
Subject: [Buildroot] mysql server and stack direction
In-Reply-To: <87mxj6uz7p.fsf@macbook.be.48ers.dk>
References: <20110501074808.87796h8v1x8gb3k8@www.home.zuerker.org>
	<87mxj6uz7p.fsf@macbook.be.48ers.dk>
Message-ID: <20110501122303.70645rnjm01sb0kk@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

Quoting Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:
>
>  Heiko> Hi,
>  Heiko> I'm working on the MySQL server package (v5.1 done, v5.5 will be
>  Heiko> next), but one of the issues is that it needs the "stack direction"
>  Heiko> set before the compile.
>
> Out of interest, why two versions?

Mostly because of worries on how well the new version is supported by  
other apps. By adding 5.5 as optional, we could get the kinks out first.
If you don't like that idea, we can simply stick with 5.1 for now and  
I'll submit the patches.

>  Heiko> Does anybody have an idea how this can be configured dynamically? I'd
>  Heiko> really hate to have to make this a config option.
>
> Almost everything (perhaps all archs supported by BR?) have stacks
> growing down, so I think hardcoding it in the .mk seems the
> easiest/best.

I like easy.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
