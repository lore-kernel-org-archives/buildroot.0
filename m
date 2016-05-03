From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 May 2016 08:18:57 +0200
Subject: [Buildroot] [PATCH v2] raspberrypi3: fix serial console (load
	pi3-miniuart-bt overlay)
In-Reply-To: <CALtfCQZowiGZUJ0HV4oTyRMfMY02TherviK_ZE6D4wgfUcQ3gg@mail.gmail.com>
 (Oscar Gomez Fuente's message of "Tue, 3 May 2016 07:58:47 +0200")
References: <1462220744-6368-1-git-send-email-ps.report@gmx.net>
 <CALtfCQZowiGZUJ0HV4oTyRMfMY02TherviK_ZE6D4wgfUcQ3gg@mail.gmail.com>
Message-ID: <871t5jr7e6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:

 > Hi Peter Seiderer,
 > What's the difference between enabling pi3-miniuart-bt instead of
 > pi3-disable-bt?

 > With pi3-disable-bt enables it works fine the serial console on (14 [TxD] &
 > 15 [RxD] pins).

From the names I would guess it is the difference between completely
disabling access to the bluetooth module and providing access to it
though the secondary (mini) uart.

The miniuart has some limitations, but I guess basic bluetooth stuff
should work with it.

-- 
Venlig hilsen,
Peter Korsgaard 
