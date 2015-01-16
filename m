From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 09:23:39 +0100
Subject: [Buildroot] support for cortex m3/m4 with newlib
In-Reply-To: <DB3PR04MB10881DC255B126BDF70B7FCEA4F0@DB3PR04MB108.eurprd04.prod.outlook.com>
References: <CAOudHSX=sc7hwE0PObED1jtDp7pOs-=PPVG_Rsh6+di9iYWojA@mail.gmail.com>
 <DB3PR04MB10881DC255B126BDF70B7FCEA4F0@DB3PR04MB108.eurprd04.prod.outlook.com>
Message-ID: <20150116092339.3021abf7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Jan 2015 07:07:25 +0000, Fabrice Mousset | GEOCEPT GmbH
wrote:

> I know that buildroot has support of Blackfin processors, which are
> also Cortex M3/M4 based, but don?t know what would be the extra work
> to port this uClinux support to more Cortex M3/M4 processor.

Blackfin processors are not Cortex M3/M4 based. Blackfin is a custom
DSP architecture, which has nothing to do with ARM Cortex M3/M4.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
