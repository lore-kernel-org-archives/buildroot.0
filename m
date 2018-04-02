From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 14:00:41 +0200
Subject: [Buildroot] Buildroot 2018.02 Mosquitto v1.4.15 : no
 CONNECT/CONNACK on libmosquitto
In-Reply-To: <87po3hoqpf.fsf@dell.be.48ers.dk>
References: <CALmdmcBazaBmEVUiCL3N6kCV4AgSp2Duqv2=iPzy1uUSTyCYyQ@mail.gmail.com>
 <20180327210232.4692d68a@windsurf.home>
 <87po3hoqpf.fsf@dell.be.48ers.dk>
Message-ID: <20180402140041.647c3d06@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 02 Apr 2018 12:19:56 +0200, Peter Korsgaard wrote:

> Did that solve your problem?

Alexis replied privately to me (he should have kept the mailing list in
Cc). Here is what he said:

==
Hi Thomas, thanks for your answer.
Indeed, reverting the version bumping (and the no-ssl build fix
introduced by 63dfbca2c3ad509504e9118a49d396210917b079), I can make it
work in my case. Since I do not want to use a modified buildroot (the
project is shared with a team), for now I will use an external
mosquitto package (in a BR2_EXTERNAL) with version 1.4.14. I will try
to bisect changes between 1.4.14 and 1.4.15 to find out why my
application is failing with last version
Regards,
==

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
