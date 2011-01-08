From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Jan 2011 19:08:21 +0100
Subject: [Buildroot] Linux kernel boot stops after NFS mount
In-Reply-To: <AANLkTingWO1X3b7dgBqh5FVM7q9oxAtyaOHP-J0WnpS-@mail.gmail.com>
References: <AANLkTikz=zS_a315fwc=F+iUL=j2P43bTi8CeJPuoHG3@mail.gmail.com>
	<4D286E5A.1010209@sensortherm.de>
	<AANLkTingWO1X3b7dgBqh5FVM7q9oxAtyaOHP-J0WnpS-@mail.gmail.com>
Message-ID: <20110108190821.59d08d47@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 8 Jan 2011 22:20:36 +0530
Divick Kishore <divick.kishore@gmail.com> wrote:

> yeah I do have generic serial port config enabled. Any other suggestions please?

Is your kernel compiled with CONFIG_AEABI ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
