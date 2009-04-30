From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 30 Apr 2009 07:31:04 +0200
Subject: [Buildroot] Broken u-boot 2009.x, undeprecate u-boot 2008.10
In-Reply-To: <d6cda7730904291655h63596d78p7227b0f7c7b6ca23@mail.gmail.com>
References: <d6cda7730904291655h63596d78p7227b0f7c7b6ca23@mail.gmail.com>
Message-ID: <20090430073104.684a701c@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Apr 2009 20:55:57 -0300
Thiago A. Corr?a <thiago.correa@gmail.com> wrote:

> Hi,
> 
>    The 2009.03 and possibly 2009.01 u-boot releases have a problem
> with JFFS2. Looks like it's not really platform specific, but it
> affects the AVR32 boards [1].
>    Not sure if it's connected, but also flinfo presents wrong
> addresses.
> 
>    I'm seeing this with 2009.03, but the message[1] talks about
> 2009.01 Is anyone else having these problems? I've just flashed
> 2008.10 and it works properly.
> 

Last working version for AVR32 is 2008.10 :/ The 2009.01 release had
another issue, which H?vard just spotted before release, too late to do
the fix. 2009.03 is broken regarding JFFS2, at least for AVR32.

>    Should we deal with 2009.03 and 2009.01 in any special way? (Drop
> them, comment as broken JFFS2?)
> 

At least make 2008.10 available, and lets hope 2009.05 can make us dump
all the previous ones.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
