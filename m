From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 03 Dec 2013 19:40:10 -0300
Subject: [Buildroot] [PATCH] flac: update to version 1.3.0
In-Reply-To: <1386108662.6732.3.camel@bender.Speedport_W_724V_Typ_A_05011601_00_065>
References: <1386108662.6732.3.camel@bender.Speedport_W_724V_Typ_A_05011601_00_065>
Message-ID: <529E5DCA.7080105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/03/2013 07:11 PM, Sven Neumann wrote:

> Remove flac-no-altivec.patch as it appears to have been
> merged upstream.
> 
> Signed-off-by: Sven Neumann <neumann@teufel.de>

Hold off this one a bit, IIRC it failed miserably to run on MIPS and/or PPC.
Let me retry and see before comitting it.
Regards.
