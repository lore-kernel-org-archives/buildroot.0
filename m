From: Chris Zankel <chris@zankel.net>
Date: Tue, 04 Dec 2012 12:40:51 -0800
Subject: [Buildroot] [PATCH v2] xtensa: add config option to enable
	longcalls option
In-Reply-To: <87wqwxmv7t.fsf@dell.be.48ers.dk>
References: <50bc6a34.45e8440a.493d.4091@mx.google.com>
 <20121203140912.1e09f0ea@skate> <50BDB610.7080304@zankel.net>
 <20121204101716.428c2f20@skate> <87wqwxmv7t.fsf@dell.be.48ers.dk>
Message-ID: <50BE5FD3.4000502@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 12/04/2012 12:13 PM, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> Hi,
>
>  >> It should actually be fine to always compile with the longcalls option, 
>  >> but I didn't just want to change it without having the option to keep 
>  >> the old behavior, hence the option.
>
>  Thomas> I'd prefer to have it always enabled, I'd say. We try to not add
>  Thomas> gazillions of very detailed architecture-specific options that are
>  Thomas> hard to understand. Hardcore users will know how/where to remove this
>  Thomas> option is they need, or they can even override it by passing a
>  Thomas> -mno-longcalls option in BR2_TARGET_OPTIMIZATION.
>
>  Thomas> What do you think?
>
> I agree. Lets use the safe option by default.
>
Not sure what you mean with the 'safe option'? I'm also not sure what
the preference for options is when you pass both, the -mlongcalls and
-mno-longcalls option at the same time?

Anyway, I'm fine with whatever solution you come up with, as long as it
makes it into the tree :-)

Thanks,
-Chris
