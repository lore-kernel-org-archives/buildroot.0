From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2020 21:01:58 +0100
Subject: [Buildroot] EFI handover support
In-Reply-To: <1579673443483-0.post@n4.nabble.com> (a.'s message of "Wed, 22
 Jan 2020 00:10:43 -0600 (CST)")
References: <1579673443483-0.post@n4.nabble.com>
Message-ID: <878slzxnt5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "a" == a  <anushka.parashar@tesco.com> writes:

 > Hi,
 > Does anyone know how to enable EFI handover support for a kernel file?
 > I am using GRUB 2 in EFI mode and when my kernel image(bzImage) is loaded it
 > throws an error saying "Kernel doesn't support EFI handover".
 > Any clue how to move ahead with this?

Do you have CONFIG_EFI_STUB=y enabled? E.G. the functionality to build
the kernel as an EFI executable.

-- 
Bye, Peter Korsgaard
