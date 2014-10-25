From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 25 Oct 2014 16:17:16 +0400
Subject: [Buildroot] [PATCH] package/aircrack-ng: add dependency on !
	BR2_PREFER_STATIC_LIB
In-Reply-To: <20141025123414.313d7f1f@free-electrons.com>
References: <1414138180-24607-1-git-send-email-jcmvbkbc@gmail.com>
 <20141025112330.6718e7c5@free-electrons.com>
 <20141025123414.313d7f1f@free-electrons.com>
Message-ID: <CAMo8BfJQmE=KEiFybnH9ZF2QABXqKQUZJu-uCYdh9XaxfWAahA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Oct 25, 2014 at 2:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sat, 25 Oct 2014 11:23:30 +0200, Thomas Petazzoni wrote:
>> I'm going to do some testing, but I believe that aircrack-ng can
>> continue to build in BR2_PREFER_STATIC_LIB configurations, and that
>> those -ldl flags are not necessary.
>
> I've committed what I believe is a better fix for the issue:
> http://git.buildroot.net/buildroot/commit/?id=68e8a10f97ffed4525c5a14b74679c682e8cbf61.
> Do not hesitate to have a look, and report back if you disagree.

with the additional patch that I've just sent it works well.

-- 
Thanks.
-- Max
