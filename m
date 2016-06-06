From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 6 Jun 2016 05:07:50 +0300
Subject: [Buildroot] [PATCH] configs/qemu: bump to latest version
In-Reply-To: <CAMo8BfKk1ShaEeWALm_B_RB7Nsx1axDMz=2WR-MwVnRnZ0HG5Q@mail.gmail.com>
References: <1465072230-12316-1-git-send-email-gustavo@zacarias.com.ar>
 <CAMo8BfKk1ShaEeWALm_B_RB7Nsx1axDMz=2WR-MwVnRnZ0HG5Q@mail.gmail.com>
Message-ID: <CAMo8BfJxY_jNUAw5HAWsuvVHcv0X8AynB=kTKGVYrOceOciK4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 6, 2016 at 5:06 AM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Sat, Jun 4, 2016 at 11:30 PM, Gustavo Zacarias
> <gustavo@zacarias.com.ar> wrote:
>> Also bump the pc samples since they're tied to the (base) qemu config.
>>
>> Results table:
>>
>> Defconfig               Kernel  Qemu            Network Status
>> --------------------------------------------------------------
>> xtensa_lx60             4.4.12  2.5.0           YES     OK (2)
>> xtensa_lx60_nommu       4.4.12  2.5.0           YES     OK (2)
>>
>> (2) - xtensa ethernet broken in 4.5/4.6
>
> The issue is actually in QEMU and it's fixed in 2.5.0.

Ugh, 2.6.0. Read the rest of the thread, sorry for the noise.

-- 
Thanks.
-- Max
