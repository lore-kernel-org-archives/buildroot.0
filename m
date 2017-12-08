From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Dec 2017 18:59:57 +0100
Subject: [Buildroot] [PATCH 7/8] atf: add support for Marvell Armada SoCs
In-Reply-To: <20171203214811.3124-8-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Dec 2017 22:48:10 +0100")
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-8-thomas.petazzoni@free-electrons.com>
Message-ID: <87shclyuaq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Sergey Matyukevich <geomatsi@gmail.com>
 > Add Marvell Armada 7k/8k SoCs support to arm-trusted-firmware package.
 > Marvell ATF needs two additional dependencies:
 > DDR training code and SCP_BL2 image.

 > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
 > [Thomas: adjust to previous ATF changes.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
