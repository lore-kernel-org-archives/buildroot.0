From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 18:00:04 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: add support for generating
	U-Boot boot scripts
In-Reply-To: <20170622164441.26e74287@windsurf.lan> (Thomas Petazzoni's
 message of "Thu, 22 Jun 2017 16:44:41 +0200")
References: <20170621214143.7184-1-thomas.petazzoni@free-electrons.com>
 <87h8z8i8o5.fsf@dell.be.48ers.dk> <20170622133120.735b26c2@windsurf>
 <87injom7hg.fsf@dell.be.48ers.dk>
 <20170622164441.26e74287@windsurf.lan>
Message-ID: <8737asm2rf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > Or maybe it's something we can take care of later?  
 >> 
 >> Or alternatively use destfile = srcfile with extension replaced by .bin

 > Doesn't really match the default case where the boot script is expected
 > by U-Boot to be called boot.scr.

Sorry, I naturally meant that the extension should be .scr, not .bin.

-- 
Bye, Peter Korsgaard
