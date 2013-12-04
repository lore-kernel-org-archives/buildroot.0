From: Sven Neumann <neumann@teufel.de>
Date: Wed, 04 Dec 2013 10:44:45 +0100
Subject: [Buildroot] [PATCH] flac: update to version 1.3.0
In-Reply-To: <529E5DCA.7080105@zacarias.com.ar>
References: <1386108662.6732.3.camel@bender.Speedport_W_724V_Typ_A_05011601_00_065>
 <529E5DCA.7080105@zacarias.com.ar>
Message-ID: <1386150285.4433.2.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Di, 2013-12-03 at 19:40 -0300, Gustavo Zacarias wrote:
> On 12/03/2013 07:11 PM, Sven Neumann wrote:
> 
> > Remove flac-no-altivec.patch as it appears to have been
> > merged upstream.
> > 
> > Signed-off-by: Sven Neumann <neumann@teufel.de>
> 
> Hold off this one a bit, IIRC it failed miserably to run on MIPS and/or PPC.
> Let me retry and see before comitting it.
> Regards.

Fine with me. I have only tested builds on two ARM platforms (XScale and
Cortex-A8).


Regards,
Sven

-- 
Sven Neumann
Senior System Architect

Lautsprecher Teufel GmbH
Gewerbehof B?lowbogen - Aufgang D1
B?lowstr. 66 - 10783 Berlin - Germany

Registernummer HRB 20271 beim Amtsgericht Berlin-Charlottenburg
Gesch?ftsf?hrer: Edgar van Velzen

Tel. +49 (0)30 - 300 930 - 0, Direkt -153
neumann at teufel.de  

www.teufel.de  www.teufelaudio.com  http://blog.teufel.de
