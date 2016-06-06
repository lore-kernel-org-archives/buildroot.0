From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 6 Jun 2016 20:24:31 -0300
Subject: [Buildroot] [PATCH] configs/qemu: bump to latest version
In-Reply-To: <CAMo8BfJxY_jNUAw5HAWsuvVHcv0X8AynB=kTKGVYrOceOciK4Q@mail.gmail.com>
References: <1465072230-12316-1-git-send-email-gustavo@zacarias.com.ar>
 <CAMo8BfKk1ShaEeWALm_B_RB7Nsx1axDMz=2WR-MwVnRnZ0HG5Q@mail.gmail.com>
 <CAMo8BfJxY_jNUAw5HAWsuvVHcv0X8AynB=kTKGVYrOceOciK4Q@mail.gmail.com>
Message-ID: <5756062F.103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/06/16 23:07, Max Filippov wrote:

>>> (2) - xtensa ethernet broken in 4.5/4.6
>>
>> The issue is actually in QEMU and it's fixed in 2.5.0.
>
> Ugh, 2.6.0. Read the rest of the thread, sorry for the noise.

Hi Max.
Since currently the complete testing setup requires manual handling of 
qemu (m68k_q800 needs a special version) you're the swing vote, either 
keep on 4.4.x kernels or ask for 2.6.0 qemu for this particular cases.
What do you think would be best?
Regards.
