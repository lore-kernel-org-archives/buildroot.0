From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 1 May 2017 12:19:10 +0200
Subject: [Buildroot] [PATCH v2 1/2] board: add stm32f429-disc1 config
In-Reply-To: <20170501114920.43c7d757@free-electrons.com>
References: <20170501091622.1930-1-s.martin49@gmail.com>
 <20170501114920.43c7d757@free-electrons.com>
Message-ID: <CAHXCMMJDOvFmYKyyrKxzORHc=A8ubFT5XTet-QihZnvuLaC2Mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 1, 2017 at 11:49 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon,  1 May 2017 11:16:21 +0200, Samuel Martin wrote:
>
>>  board/stmicroelectronics/stm32f429-disc1            |  1 +
>
> Does it really make sense to create a symbolic link ?

indeed none, I'll remove it

>
>> --- a/board/stmicroelectronics/stm32f429-disco/readme.txt
>> +++ b/board/stmicroelectronics/stm32f429-disco/readme.txt
>> @@ -15,8 +15,8 @@ Wire the UART
>>
>
> The beginning of this document should be updated to mention that it
> supports both platform, through the same defconfig.

Done

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
Samuel
