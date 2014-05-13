From: Digesh patel <digpeshark@gmail.com>
Date: Tue, 13 May 2014 14:57:01 +0530
Subject: [Buildroot] error while building kernel linux 2.6.19
In-Reply-To: <CA+1cARzjF8hapKmHUUrS=dWMhUCAnvzqVtbXWnOknFs-dbCzQw@mail.gmail.com>
References: <CA+1cARzjF8hapKmHUUrS=dWMhUCAnvzqVtbXWnOknFs-dbCzQw@mail.gmail.com>
Message-ID: <CA+1cARyZ-JiXanYHDq7AAyd+3O7VhcOwnjjaULqBKMYQoNN4QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i am getting error while building linux 2.6.19 after installing
buildroot tool.i am using following,

target system=powerPC MPC8555 processor with linux 2.6.19
host system having linux-2.6.32.11-custom-2.6.32.11.
i am sending you error message when building kernel 2.6.19

i am getting following error message after giving this command

root at systemuser-desktop:/home/systemuser/xenomai_BEL/rajj1/linux-2.6.19#
make ARCH=powerpc CROSS_COMPILE=powerpc-linux- uImage
make: powerpc-linux-gcc: Command not found
/home/systemuser/xenomai_BEL/rajj1/linux-2.6.19/scripts/gcc-version.sh:
line 11: powerpc-linux-gcc: command not found
/home/systemuser/xenomai_BEL/rajj1/linux-2.6.19/scripts/gcc-version.sh:
line 12: powerpc-linux-gcc: command not found
*** 2.6 kernels no longer build correctly with old versions of binutils.
*** Please upgrade your binutils to 2.12.1 or newer
make: *** [checkbin] Error 1

please help me how to overcome this error

Thanks,
Digesh
