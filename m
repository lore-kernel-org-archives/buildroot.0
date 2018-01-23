From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 23 Jan 2018 15:31:53 +0100
Subject: [Buildroot] [PATCH] scanpypi: ignore empty elements in package
 requirements
In-Reply-To: <CANQCQpZRXFjBo_oyOBWLyB5Nkf9a45RFUhR_6J79UEC818McCQ@mail.gmail.com>
References: <1516695187-1193-1-git-send-email-yegorslists@googlemail.com>
 <CANQCQpZRXFjBo_oyOBWLyB5Nkf9a45RFUhR_6J79UEC818McCQ@mail.gmail.com>
Message-ID: <CAGm1_kv4TnwREMrnaudPTVELXmhOc51ZQoCXvmA+H9vzvbz0Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 23, 2018 at 3:27 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Yegor,
>
> On Tue, Jan 23, 2018 at 2:13 AM,  <yegorslists@googlemail.com> wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Depending on how setup.py reads requirements files empty elements can occur.
>> This patch takes care, that such elements will be ignored and don't crash
>> the scanpypi script.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> I used this new python package for testing
> (https://patchwork.ozlabs.org/patch/864829/)
>
> Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

Thanks for testing.

Yegor
