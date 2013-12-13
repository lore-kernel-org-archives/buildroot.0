From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Fri, 13 Dec 2013 07:37:56 -0600
Subject: [Buildroot] Gdbserver buildroot 2013.11
In-Reply-To: <CABFW0b2ypG8i+=1W2fBGz08wj=toHwUUEDeOiQX=vHL8oEv65A@mail.gmail.com>
References: <CABFW0b2ypG8i+=1W2fBGz08wj=toHwUUEDeOiQX=vHL8oEv65A@mail.gmail.com>
Message-ID: <OF741A4E98.2514B2B8-ON86257C40.004AC126-86257C40.004AE288@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeronimo,

buildroot-bounces at busybox.net wrote on 12/13/2013 06:25:51 AM:

> From: Jeronimo Munoz <jeronimo.munoz@mirada.tv>
> To: buildroot at uclibc.org
> Date: 12/13/2013 06:26 AM
> Subject: [Buildroot] Gdbserver buildroot 2013.11
> Sent by: buildroot-bounces at busybox.net
> 
> Hello,
> 
> I'm trying to enable gdbserver in buildroot 2013.11 but the option 
> "Build gdb server for the target" is not present in menuconfig. How 
> can I enable this option?
> 

This feature was moved under 
    Target Packages -> Debugging, profiling and benchmark -> gdb

Thanks,
Matt Weber
mlweber1 at rockwellcollins.com
