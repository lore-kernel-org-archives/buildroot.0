From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Feb 2019 18:04:02 +0100
Subject: [Buildroot] [PATCH-for-master] boot/syslinux: fix build with
 EFI support
In-Reply-To: <871s3ueopv.fsf@dell.be.48ers.dk>
References: <20190226111332.7615-1-casantos@datacom.com.br>
 <871s3ueopv.fsf@dell.be.48ers.dk>
Message-ID: <20190226180402.3e4b279a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Feb 2019 13:09:00 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> I guess we don't have any tests or autobuilder runs for this, we
> probably should add one.

Oh, yes, more runtime tests (even if they are just build testing) for
bootloader/firmware stuff would be *very* useful.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
