From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 6 Jun 2016 05:06:37 +0300
Subject: [Buildroot] [PATCH] configs/qemu: bump to latest version
In-Reply-To: <1465072230-12316-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465072230-12316-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAMo8BfKk1ShaEeWALm_B_RB7Nsx1axDMz=2WR-MwVnRnZ0HG5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 4, 2016 at 11:30 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Also bump the pc samples since they're tied to the (base) qemu config.
>
> Results table:
>
> Defconfig               Kernel  Qemu            Network Status
> --------------------------------------------------------------
> xtensa_lx60             4.4.12  2.5.0           YES     OK (2)
> xtensa_lx60_nommu       4.4.12  2.5.0           YES     OK (2)
>
> (2) - xtensa ethernet broken in 4.5/4.6

The issue is actually in QEMU and it's fixed in 2.5.0.

-- 
Thanks.
-- Max
