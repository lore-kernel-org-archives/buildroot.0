From: Patryk Benderz <Patryk.Benderz@esp.pl>
Date: Wed, 06 Apr 2011 12:22:52 +0200
Subject: [Buildroot] [HALd] Slow startup (>4min.)
In-Reply-To: <20110405215703.19ccce2e@surf>
References: <1301995387.4891.40.camel@esp-patben-lin.espdx1.local>
	<20110405215703.19ccce2e@surf>
Message-ID: <1302085372.4891.80.camel@esp-patben-lin.espdx1.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[cut]
> Could you run it through strace to see what's going on ?
Hi Thomas,
Thanks for help. I could if this is necessary. If this Helps, when I
start HAL as:
# hald --verbose=yes
I get all info on console instantly with last line saying: "becoming a
demon". Then for 4 minutes nothing happens and after that Console prompt
returns.

> However, notice that HAL is deprecated these days. For what usage do
> you need HAL ?
Auto mounting USB storage (usbmount does not seem to work, and there is
no info in any log files about it)

> I'm currently packaging udisks and all related dependencies, so that
> signalisation of block device events can be propagated on D-Bus.
Will it automount USB pendrives with FAT32 fs?
What time horizon do you see before udisks are usable in one of BR
releases? I mean... should I wait, or it will take long?

-- 
Patryk "LeadMan" Benderz
Linux Registered User #377521
()  ascii ribbon campaign - against html e-mail 
/\  www.asciiribbon.org   - against proprietary attachments
