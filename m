From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 10 Jun 2018 13:46:30 -0700
Subject: [Buildroot] xtensa: qemu_xtensa_lx60 issue with gcc 8.1
In-Reply-To: <8d26aa17-fe18-2f56-8eb0-d32073ad099b@gmail.com>
References: <8d26aa17-fe18-2f56-8eb0-d32073ad099b@gmail.com>
Message-ID: <CAMo8Bf+TYADAm93CKCAxrFUBtwEf4hgcKZ3_SbriUgC5Tu80Cg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 10, 2018 at 1:39 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Hello Max,
>
> We recently added gcc 8.1 in Buildroot and checked if all qemu configs are able
> to boot correctly:
>
> https://gitlab.com/free-electrons/toolchains-builder/pipelines/23083553
>
> Unfortunately the qemu_xtensa_lx60 config doesn't boot using a toolchain with
> gcc 8.1, binutils 2.30, uclibc-ng 1.0.30 and a kernel 4.16.7.
>
> See: https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006443
>
> I'm able to reproduce the issue and fallback to gcc 7.3 allow to boot the system
> on Qemu. So it seems really related to the gcc version.
>
> Do you have any clue ?

Not yet, but let me look at it. Thanks for the report.

-- 
Thanks.
-- Max
