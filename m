From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 23 Jan 2018 15:33:28 +0100
Subject: [Buildroot] [PATCH 1/2] python-flask-cors: new package
In-Reply-To: <CANQCQpa2yBJggVDvtUhHmPd+qP1wJvGZz9+Gsv9JGUDoLWLHxA@mail.gmail.com>
References: <1516681048-16580-1-git-send-email-matthew.weber@rockwellcollins.com>
 <CAGm1_kt3d8wHA0+Eqr0x7+ZqTNZJQ5K3_ZH=ymFB3y0KyvQ=xA@mail.gmail.com>
 <CANQCQpa2yBJggVDvtUhHmPd+qP1wJvGZz9+Gsv9JGUDoLWLHxA@mail.gmail.com>
Message-ID: <CAGm1_ksPjiuYLx9S6b36412FiZMB3KKgxMAvWy706hfszgj7fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 23, 2018 at 3:26 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Yegor,
>
> On Tue, Jan 23, 2018 at 2:15 AM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
>>
>> Hi Matt,
>>
> [snip]
>>
>> Please apply this patch [1] and try to readd this package via
>> utils/scanpypi. python-flask-cors discovered some bugs in the script,
>> but now it is working, so you don't need to tweak the package
>> manually.
>>
>> [1] http://patchwork.ozlabs.org/patch/864626/
>
> That is so cool!  I haven't added a python package in a few years and
> didn't realize the script was there.  Thank you.
>
> Superseded by: https://patchwork.ozlabs.org/patch/864829/

Oh yes, scanpypi saves a lot of time :-)

Yegor
