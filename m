From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 7 Jun 2013 09:34:14 +0200
Subject: [Buildroot] strace-4.8
In-Reply-To: <13f1b4af906.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
References: <51B0DB7A.3070507@zankel.net>
 <13f1b4af906.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
Message-ID: <CAC1BbcT6+-VddQUEmZGJdYVvxa_2ZFs3O4pGBpJ6YBiUk10Cjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6 June 2013 23:01, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:
> On 6 June 2013 20:56:58 Chris Zankel <chris@zankel.net> wrote:
>>
>> Hi,
>>
>> With strace-4.8 just released, we can probably now enable the package
>> for aarch64(?), arc, and xtensa :-)
>>
>> I don't have a patch ready (yet), as there are two patches in the strace
>> package I'm not sure are still necessary:
>>
>> strace-fix-arm-bad-syscall.patch - add fix for ARM fake syscall from
>> execve. Closes #626
>> strace-fix-disabled-largefile-syscalls.patch - bump version and make it
>> behave of LFS is of
>
>
> It could be that the LFS one is already in current strace, I can have a look
> tomorrow if you don't beat me to it..

The LFS one should not be needed anymore.
It sounds a bit like the TCB_WAITEXECVE was fixed, too, but better
verify this yourself.

HTH,
