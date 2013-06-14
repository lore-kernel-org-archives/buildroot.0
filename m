From: soochon radee <sradee@gmail.com>
Date: Fri, 14 Jun 2013 16:24:42 -0400
Subject: [Buildroot] [PATCH] toolchain/crostool-NG: mark as deprecated
Message-ID: <CADXR8ejLiDw3ZDR3iBRfYKBqqJ5abS5OSV=cGqXChxKvsPHioA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I know I'm chiming in late here, but I actively use ctng to build an eglibc
toolchain within buildroot. I hope that you can retain it until Thomas's
successor is in and running.

Thanks,

Soochon


>>
>> I don't have real comments about the proposal to deprecate the
>> Crosstool-NG support, but I'd like to take this opportunity to unveil
>> my plans about the internal toolchain support (I hate unveiling plans
>> before the code is ready, but it seems like a good idea in this
>> particular case) :
>>
>>  (1) I am currently converting the existing internal toolchain logic
>>  to
>>      use the package infrastructure. I've already done it for
>>      'gdb' (merged for 2013.05), I have patches that seem to work for
>>      elf2flt and linux-headers, and I've started working on
>>      converting
>>      gcc (which is the most complicated piece of the puzzle).
>>
>>  (2) Once this conversion is done, I intend to work on adding
>>  (e)glibc
>>      support to the internal toolchain backend, so that regardless of
>>      what happens with the Crosstool-NG backend, Buildroot will
>>      continue to have the possibility to build a (e)glibc toolchain.
>>
>> (1) and (2) represent a significant amount of work, so don't expect
>> those things to be ready overnight.
>>
>
>ok, thanks for the news, I was a bit worried that we had would have no
>support for self-compiled glibc toolchain at some point (that was the
>main reason I was using ct-ng)
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130614/0c5d0ac4/attachment.html>
