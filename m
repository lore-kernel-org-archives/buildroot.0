From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 May 2016 00:18:57 +0200
Subject: [Buildroot] [PATCH v2] Config.in: add -Og option
In-Reply-To: <573CE8F0.80200@surround.io>
References: <1463442955-8178-1-git-send-email-martin@surround.io>
 <7e07c970-b00e-f605-7192-3152d53885e1@mind.be> <573CCB3C.1040703@surround.io>
 <2cb76318-9eb7-eacc-cdc3-e014604d2628@mind.be> <573CE8F0.80200@surround.io>
Message-ID: <0df6a0c0-1280-94a8-03ab-b1b6e4ca9eb0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/19/16 00:13, Martin Kelly wrote:
> On 05/18/2016 03:00 PM, Arnout Vandecappelle wrote:
>> On 05/18/16 22:06, Martin Kelly wrote:
>>> On 05/18/2016 12:52 PM, Arnout Vandecappelle wrote:
>>>> On 05/17/16 01:55, Martin Kelly wrote:
>>>>> -Og (introduced in GCC 4.8) lets you optimize for debugging experience,
>>>>> which can be useful for when you want optimized code that is
>>>>> nonetheless
>>>>> debuggable.
>>>>>
>>>>> Signed-off-by: Martin Kelly <martin@surround.io>
>>>>> ---
>>>>> Changes based on feedback:
>>>>> - select --> depends on
>>>>> - Reworded help text
>>>>> - Wrapped text to 72 lines
>>>>
>>>>   Well, actually you didn't: you just copied my text, which I
>>>> incorrectly wrapped at 78 columns instead of 72...
>>>>
>>>
>>> You may have wrapped to 78, but I rewrapped it to 72 columns, so I
>>> think the
>>> patch I sent is correctly wrapped.
>>
>>   By my count, the line 'reasonable level of optimization while
>> maintaining fast compilation' is 68 characters long. with the tab + 2
>> spaces that becomes 78.
>>
>
> I was working under the assumption that tabs count as 1 character. If tabs count
> as 8 characters instead, then the rest of the file is already miswrapped; there
> are many lines containing a tab, 2 spaces, and 70 characters after. Under
> BR_OPTIMIZE_2, the line starting with "the performance of the generated code" is
> an example of that. In addition, most text editors seem to count a tab as 1
> character when displaying width (Vim certainly does).
>
> If the intention is to count a tab as 8 characters, I'd be happy to do so, but
> then we should also rewrap the rest of the file for consistency.

  You have a point there. I'll Ack your v3, care to send a follow-up that 
rewraps the entire file?

  Regards,
  Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
