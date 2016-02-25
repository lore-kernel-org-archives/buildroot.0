From: Patrick Doyle <wpdster@gmail.com>
Date: Thu, 25 Feb 2016 15:02:20 -0500
Subject: [Buildroot] buildroot with linaro-5.2-2015.11-1 toolchain
Message-ID: <CAF_dkJB=bcGLC7cTKxz=cDGa12D5DqT4JX-qDDyApjFswtraDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

arrgghh...nothing seems to be going smoothly today.  Well, some days
are like that..

Is buildroot known to work (or not work) with the linaro-5.2-2015.11-1
toolchain (available at
https://releases.linaro.org/components/toolchain/binaries/latest-5.2/arm-linux-gnueabihf/)
specified as an external preinstalled toolchain?

Obviously, I'm asking because it's not working for me.  Things appear
to start going south when the following command:

$ arm-linux-gnueabihf-gcc -print-file-name=libc.a


produces the following output on my system:

libc.a

Did I do something wrong when I installed it?  (I just unpacked it into /opt).

--wpd
