From: Kent <kent@zydax.com>
Date: Tue, 24 Jul 2007 12:48:42 -0700
Subject: [Buildroot] Error Building Linux - Board Support
	Options:at91sam9260ek, at91sam9260dfc, etc
In-Reply-To: <000001c7ce1d$6d9cbb30$6b01a8c0@RANDY>
Message-ID: <000001c7ce2b$a37f8f30$6b01a8c0@RANDY>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello again,

> target/device/Atmel/at91sam9260ek/at91sam9260ek-limux-.config

We did a little digging and discovered that the LINUX26_KCONFIG variable
didn't seem to be setting correctly (target/device/Atmel/Makefile.in). We
changed  the := to just = and that seemed to help. I have no idea what the
long-term implications of this change are, but thought I'd mention that it
worked at least.

> I've checked the contents of 'target/device/Atmel/
> and I don't find an at91sam9260ek directory.

Still no solution on this though. Don't know if there NEEDS to be an 'ek'
directory or not, but it's looking for one.

Thanks,
Kent

No virus found in this outgoing message.
Checked by AVG Free Edition. 
Version: 7.5.476 / Virus Database: 269.10.17/915 - Release Date: 7/24/2007
1:50 PM
 
