From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Fri, 24 Jun 2011 10:27:11 -0400
Subject: [Buildroot] how to tune powerpc e500v2 cpus in BR
Message-ID: <BANLkTikRNGx1Mte+sOYDeOr9f896K8GuZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am using freescale's p1020 CPU. It is a e500v2 core. How could I
config the build root to tune the tool chain for the following
options:

-mcpu=8548 -mspe=yes -mabi=spe -mhard-float -mfloat-gprs=double

From the menuconfig, I can only select CPU as 8540.

Thanks,

Raymond
