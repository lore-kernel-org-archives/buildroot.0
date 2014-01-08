From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 8 Jan 2014 12:27:38 -0600
Subject: [Buildroot] [PATCH] cryptsetup: Link against -lrt for
	clock_gettime
In-Reply-To: <52CD7B62.6000106@zacarias.com.ar>
References: <1389115451-4096-1-git-send-email-Vincent.Riera@imgtec.com>
 <OF00B93CC6.8A6EB2A8-ON86257C5A.0052E7B2-86257C5A.00538718@rockwellcollins.com>
 <52CD7B62.6000106@zacarias.com.ar>
Message-ID: <OF2E6B5209.C0B8B95C-ON86257C5A.006542A1-86257C5A.00655EBD@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

Gustavo Zacarias <gustavo@zacarias.com.ar> wrote on 01/08/2014 10:22:58 
AM:

> Hi, take a look at packages/linux-pam/linux-pam-04-mkdir.patch maybe
> it's the same problem? (very old bundled gettext).
> Regards.

That is the same problem exactly.  Thanks for pointing that out.

Vicente,

Would you be able to incorporate that patch into your submission for 
fixing cryptsetup?


Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
