From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 11:12:44 -0300
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
 conditional
In-Reply-To: <20141020155447.21c7c7ff@free-electrons.com>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>	<20141020150209.5f8b45a5@free-electrons.com>	<54450BF5.4000202@zacarias.com.ar>	<20141020152759.4f438890@free-electrons.com>	<54450F51.5050801@zacarias.com.ar>	<20141020153719.034df3be@free-electrons.com>	<54451174.5060309@zacarias.com.ar>
 <20141020155447.21c7c7ff@free-electrons.com>
Message-ID: <5445185C.6020604@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/20/2014 10:54 AM, Thomas Petazzoni wrote:

>> Yes, it's called baselayout in gentoo, base-files in some other distros
>> and so on, you probably already know them.
> 
> Yep.
> 
>> But nobody made it yet.
> 
> Indeed, but it wouldn't be too hard to do I believe.

Not at all, already done in private initscript revamp, but not in an
upstreamable/generic way since it's not finished, part of my
configurable sysv initscripts (i think i've mentioned the idea on the ML
and/or IRC).
I dunno if Maxime or someone else is working on anything similar since
i'm somewhat outside the loop, and my motivation is pretty low as i've
already said.
Regards.
