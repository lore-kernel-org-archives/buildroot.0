From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Feb 2019 13:09:00 +0100
Subject: [Buildroot] [PATCH-for-master] boot/syslinux: fix build with
 EFI support
In-Reply-To: <20190226111332.7615-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Tue, 26 Feb 2019 08:13:32 -0300")
References: <20190226111332.7615-1-casantos@datacom.com.br>
Message-ID: <871s3ueopv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > Commit 1a437fd22f bumped gnu-efi to version 3.0.9. This breaks the build
 > of syslinux with EFI support due to multiple definitions of 'memset' and
 > 'memcpy'. Backport a patch already applied upstream to fix the problem.

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Committed, thanks.

I guess we don't have any tests or autobuilder runs for this, we
probably should add one.

-- 
Bye, Peter Korsgaard
