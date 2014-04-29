From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Apr 2014 20:52:43 +0200
Subject: [Buildroot] Need python Executable for Embedded Linux
In-Reply-To: <259414F34B255342B3ADC9C67B64BA752E7BD7AC@xmb-rcd-x02.cisco.com>
References: <259414F34B255342B3ADC9C67B64BA752E7BD7AC@xmb-rcd-x02.cisco.com>
Message-ID: <20140429205243.3d186811@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mohammed Areef Mulla (mmulla),

On Tue, 29 Apr 2014 11:26:10 +0000, Mohammed Areef Mulla (mmulla) wrote:

> My machine details are:
> 
> bash-3.00# uname -a
> Linux localhost 2.6.21_mvlcge500-octeon-mips64_octeon_v2_be #1 SMP PREEMPT Thu Apr 24 16:57:16 IST 2014 mips64 unknown
> bash-3.00#
> 
> Can you please provide the steps to generate Python exe for this platform?

Use Buildroot, and generate a MIPS64 root filesystem with the Python
interpreter? Notice that Buildroot is mainly intended to generate
complete filesystems, not to build a single binary for an existing
filesystem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
