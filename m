From: Chris Zankel <chris@zankel.net>
Date: Tue, 20 Nov 2012 16:35:34 -0800
Subject: [Buildroot] Xtensa in the autobuilders, first build failures
In-Reply-To: <20121119234601.6274d4a6@skate>
References: <20121118232518.091b6154@skate> <50AAA88E.3090603@zankel.net>
 <20121119234601.6274d4a6@skate>
Message-ID: <50AC21D6.2080405@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 11/19/2012 02:46 PM, Thomas Petazzoni wrote:
> On Mon, 19 Nov 2012 13:45:50 -0800, Chris Zankel wrote:
>
>> However, I noticed that it was not the most recent version where I
>> incorporated suggestions from Arnout, so will provide a small patch on
>> top of it.
> Ah, sorry, my bad. Don't hesitate to send a follow-up patch that fixes
> the remaining problems.
No worries, I think my email system wasn't working, so maybe you didn't
even get them.

I'm lining up a few patches, just running some more build tests (which
always take some time)

> Adding support for one architecture in libffi is not very simple, so if
> you don't need it for your own projects, I don't think you'll have the
> energy to work on this. 
You are right, it looks like some work, and it would be lower priority.
I'll just disable it for Xtensa for now.

>>> Besides those issues, I'm just reminding you that we are still very
>>> interested in having a Qemu Xtensa configuration to be able to run the
>>> Xtensa systems we generate with Buildroot.
>> I'm juggling between kernel, uClibc, and buildroot, so, please allow me
>> some more time.
> Sure, no problem!
How do you actually build qemu inside buildroot, or is this not
supported? I couldn't find any config option to enable it.
Also note that the current kernel version (3.6) doesn't have all
required patches, we are 'forward-focusing' at the moment, so things
will be easier in the future.

>> Regarding patches, should I send them to you and cc buildroot, or only
>> to the mailing list? What's the best path to get them looked at and
>> integrated into the tree?
> Just send them to the list. You can Cc: me as well if you want, but I'm
> basically reading everything that goes on the Buildroot list, so I
> should catch them even if you don't Cc: me.
Thanks. I'll keep them coming :-)

Cheers!
-Chris
