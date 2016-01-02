From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 23:11:03 +0100
Subject: [Buildroot] [PATCH 0/84 RFC] all: use 'menuconfig' to group
 sub-options (branch yem/menuconfig)
In-Reply-To: <20160102110921.GF3477@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <56847581.6000407@mind.be> <20151231172852.GG3495@free.fr>
 <56872C44.9090202@mind.be> <20160102110921.GF3477@free.fr>
Message-ID: <56884AF7.4030100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-01-16 12:09, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2016-01-02 02:47 +0100, Arnout Vandecappelle spake thusly:
>> On 31-12-15 18:28, Yann E. MORIN wrote:
>>> On 2015-12-31 01:23 +0100, Arnout Vandecappelle spake thusly:
>>>> On 25-12-15 22:25, Yann E. MORIN wrote:
>>>>> Hello All!
>>>>>
>>>>> This RFC series is a proposal to cleanup the layout of the menuconfig
>>>>> UI. Although it looks to be pretty long (84 patches), it really is only
>>>>> three different changes :
>>>>>
>>>>>   - patches 1-6: re-order comments to fix indentation of sub-options;
>>>>>     this can probably be applied without too much discussion, as it is
>>>>>     really only a cleanup;
>>>>>
>>>>>   - patches 7-35: changes use of 'config'+'menu' into a 'menuconfig'
>>>>>     (the Kconfig keywords) to automatically arrange the sub-options into
>>>>>     sub-menus;
>>>>>
>>>>>   - patches 36-84: document that packages with 5 or more options should
>>>>>     use sub-menus (with 'menuconfig') to store their sub-options
>>>>>     (patches 36-39); it then changes a lot of packages accordingly
>>>>>     (patches 40-84).
>>>>
>>>>  I reviewed and tested patches 7-39, you can add my
>>>>
>>>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>>
>>> Thank you for the review. I know by experience that reviewing long
>>> series can be tedious, so: thanks!
>>
>>  You can now ack up to and including 58 (libiio).
> 
> Great! Thank you very much for having had another look! :-)
> 
> (I'll add your ACKs after fixing the little nits here and there you
> already commented on, like comments to drop...)
> 

 And finally, for patches 59-84:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Thanks for this series, Yann!

 Regards,
 Arnout


>>>> to the ones where I didn't have comments. I didn't bother adding Acks everywhere
>>>> because it's anyway not going to be picked up by Patchwork.
>>>
>>> Yep, I sent the series as an RFC, just to "feel the temperature of the
>>> water".
>>
>>  For actual submission, perhaps squash a little here and there. Although in fact
>> they're not really squashable, except perhaps 41-84 but that would be a pretty
>> big patch.
> 
> Well, and what about my commit count? ;-]
> 
> But yeah, I don't think we could squash it, at least during the review. I
> think it is easier to review a lot of little patches rather than a bit
> one even if the changes are simple.
> 
> Thanks!
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
