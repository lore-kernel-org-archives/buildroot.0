From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 20 Dec 2016 15:09:42 +0100
Subject: [Buildroot] [PATCH] can-utils: fix build with glibc versions
	before 2.17
In-Reply-To: <3555688d-fc24-c979-3e5c-a7c36caea50e@imgtec.com>
References: <1482241325-29293-1-git-send-email-rahul.bedarkar@imgtec.com>
 <CAGm1_kvOKHSakr1coVB+jXDfmEpwrCh3LqmCDmb3Zju30CfSCw@mail.gmail.com>
 <3555688d-fc24-c979-3e5c-a7c36caea50e@imgtec.com>
Message-ID: <CAGm1_kuFj3NHO+5Lw6+-cvFxwPdBNTgmc4Hj0DSJ73YSF90_uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 20, 2016 at 3:06 PM, Rahul Bedarkar
<Rahul.Bedarkar@imgtec.com> wrote:
> Hi Yegor,
>
> On Tuesday 20 December 2016 07:20 PM, Yegor Yefremov wrote:
>>
>> Hi Rahul,
>>
>>
>>
>> On Tue, Dec 20, 2016 at 2:42 PM, Rahul Bedarkar
>> <rahul.bedarkar@imgtec.com> wrote:
>>>
>>> glibc versions before 2.17 needs to link with librt for
>>> clock_nanosleep(). This commmit adds patch to detect if linking
>>> with librt is required.
>>>
>>> Fixes:
>>>
>>> http://autobuild.buildroot.net/results/0e5/0e5242376ff6aa82e89ed1172350e05009d48156
>>>
>>> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
>>> Cc: Yegor Yefremov <yegorslists@googlemail.com>
>>
>>
>> good catch. Can you submit this patch upstream? Usually it will be
>> quickly accepted, so that one can just bump the version instead of
>> including a patch.
>
>
> Thanks, I've sent pull request.

And as I've promised, it was already merged. So just send a patch with
a version bump.

Yegor
