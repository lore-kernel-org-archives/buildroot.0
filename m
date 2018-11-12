From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Nov 2018 23:55:44 +0100
Subject: [Buildroot] [PATCH 1/1] libnspr: bump to version 4.20
In-Reply-To: <20181110161511.5630-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 10 Nov 2018 17:15:11 +0100")
References: <20181110161511.5630-1-fontaine.fabrice@gmail.com>
Message-ID: <87woph52j3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Support for riscv was added in this version
 > Fixes:
 >  - http://autobuild.buildroot.org/results/a98db13ea105d627f2a4770969b31550926c2791

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to master because of the riscv fixes and because it is a
dependency on libnss 3.39, thanks.

-- 
Bye, Peter Korsgaard
