From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 23 May 2016 18:44:38 +0200
Subject: [Buildroot] [PATCH v2] python-backports-abc: depend on Python
	2.x
In-Reply-To: <20160523170847.0c25beb7@free-electrons.com>
References: <1463641229-6426-1-git-send-email-yegorslists@googlemail.com>
 <20160523170847.0c25beb7@free-electrons.com>
Message-ID: <CAGm1_ku6+ejOt+qD7uSNg+o0Zh880CSzsTnLMk5Kyr9+yt64mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 23, 2016 at 5:08 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 19 May 2016 09:00:29 +0200, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> This package is a backport from Python 3.5, so it is not needed
>> for Python 3.5.x environment.
>>
>> Fix python-tornado dependecies, so that python-backports-abc
>> is only selected for Python 2.x.
>>
>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>> Changes:
>>       v2: sqaush both commits into one (Arnout Vandecappelle)
>
> I've applied to next, because Python 3.5 is only in next. Let me know
> if I misunderstood something.

No. next is the right branch. I just forgot to mention in the subject.

Yegor
