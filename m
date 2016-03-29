From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Mar 2016 16:33:18 +0200
Subject: [Buildroot] [PATCH 0/5] Align library locations in target and
 staging
In-Reply-To: <CAAXf6LUA=n=5u6TkEsEWbMu2NdbVQzBHOPzSXyTgbQGHE_ZWSg@mail.gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <56F84507.3050209@mind.be>
 <CAAXf6LUA=n=5u6TkEsEWbMu2NdbVQzBHOPzSXyTgbQGHE_ZWSg@mail.gmail.com>
Message-ID: <56FA922E.5090904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/29/16 16:21, Thomas De Schampheleire wrote:
> Hi Arnout,
>
> On Sun, Mar 27, 2016 at 10:39 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>>   I've also done a review and a test of the entire series. There is a bit of
>> reworking suggested by Romain in patch 3/5, the removal of -follow that I
>> suggest in patch 4/5, and I would like to re-instate the --sysroot check in
>> patch 2/5, but that's it.
>>
>>   ThomasDS, will you respin or do we apply and make changes afterwards?
>
> I think it makes sense to respin to keep history clean, unless you
> prefer to apply first and deblock Romain. That is also fine by me. I
> just need some time to do the respin and retest.

  No, better if you do the respin. It's not going to take you months to retest, 
right?


> Thanks for the review both you and Romain, I really appreciate it.

  You're welcome. It was actually a lot less work than I feared.

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
