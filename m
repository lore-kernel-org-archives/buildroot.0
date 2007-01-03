From: Will Buik <willbuik@gmail.com>
Date: Tue, 2 Jan 2007 21:22:30 -0500
Subject: [Buildroot] Cross compiling problems with OpenSSH
Message-ID: <1d09f8b80701021822u562a6421v26d3578afb7fb0b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am having trouble compiling the OpenSSH package into buildroot:

checking compiler and flags for sanity... configure: error: cannot run
test program while cross compiling
See `config.log' for more details.
make: *** [/home/will/box/buildroot/buildroot/build_i686/openssh-3.9p1/.configured]
Error 1

Is there a way around this error, I enabled the package using "make menuconfig".
