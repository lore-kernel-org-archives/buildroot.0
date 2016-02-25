From: Patrick Doyle <wpdster@gmail.com>
Date: Thu, 25 Feb 2016 15:24:18 -0500
Subject: [Buildroot] buildroot with linaro-5.2-2015.11-1 toolchain
In-Reply-To: <56CF60D0.6060500@gmail.com>
References: <CAF_dkJB=bcGLC7cTKxz=cDGa12D5DqT4JX-qDDyApjFswtraDQ@mail.gmail.com>
 <56CF60D0.6060500@gmail.com>
Message-ID: <CAF_dkJCsPjyD61DA9-+VE7i+D-NLnwJBLxVxwZ-Lpu3DDJO5=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 25, 2016 at 3:15 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Hello,
>
> Le 25/02/2016 21:02, Patrick Doyle a ?crit :
>> arrgghh...nothing seems to be going smoothly today.  Well, some days
>> are like that..
>>
>> Is buildroot known to work (or not work) with the linaro-5.2-2015.11-1
>> toolchain (available at
>> https://releases.linaro.org/components/toolchain/binaries/latest-5.2/arm-linux-gnueabihf/)
>> specified as an external preinstalled toolchain?
>
> Don't use 5.2-2015.11-1 it's broken use 5.2-2015.11-2 which is already supported
> by Buildroot 2016.02-rc2.
>
> See https://bugs.linaro.org/show_bug.cgi?id=1995

Thanks.  I managed to track that down just _after_ I posted my
frustrated email :-)

Golly it would be nice if the latest-5.2 link at
https://releases.linaro.org/components/toolchain/binaries/ pointed
folks at the 11-2 toolchain instead of the 11-1 toolchain.

Oh well.

--wpd
