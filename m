From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 8 Apr 2013 14:04:17 +0800
Subject: [Buildroot] [PATCH v2 3/7] arch: toolchain: Introduce binary
 formats BINFMT_*.
In-Reply-To: <20130407224747.6e0892cc@skate>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-3-git-send-email-sonic.adi@gmail.com>
 <20130407224747.6e0892cc@skate>
Message-ID: <CAJxxZ0NvVC-E9tNToCU_im=jwgKLu5eMb0ZyDEJwpMEN-JidSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Apr 8, 2013 at 4:47 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Fri, 29 Mar 2013 17:50:39 +0800, Sonic Zhang wrote:
>
>> +choice
>> +     prompt "Target Binary Format"
>> +     default BR2_BINFMT_ELF
>> +config BR2_BINFMT_ELF
>> +     bool "ELF"
>> +config BR2_BINFMT_FDPIC
>> +     bool "FDPIC"
>> +config BR2_BINFMT_FLAT
>> +     bool "FLAT"
>> +     select BR2_PREFER_STATIC_LIB
>> +endchoice
>
> Maybe some help text would also be nice for each choice.
>
OK

Regards,

Sonic
