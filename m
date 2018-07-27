From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 08:58:38 +0200
Subject: [Buildroot] using LINUX_DIR variable in BR
In-Reply-To: <CAAMHf5Eu6H49vRDgR1_XikvK8fBo=_hVYPd2hU3QytkgO4_x5A@mail.gmail.com>
References: <CAAMHf5Eu6H49vRDgR1_XikvK8fBo=_hVYPd2hU3QytkgO4_x5A@mail.gmail.com>
Message-ID: <20180727085838.7344b3b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jul 2018 22:13:10 +0530, ravi chandran wrote:

>      I am trying to include the path of the linux kernel(source located in
> output/build/linux) in one of the makefile which is located outside the
> linux directory.
> 
> KERNEL_DIR := $(LINUX_DIR).

Use the = operator and not the := operator.

See
https://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_6.html#SEC59.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
