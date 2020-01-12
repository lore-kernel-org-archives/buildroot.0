From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 09:51:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/scons: fix hash of license file
In-Reply-To: <20200111220620.1892368-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 11 Jan 2020 23:06:20 +0100")
References: <20200111220620.1892368-1-fontaine.fabrice@gmail.com>
Message-ID: <87wo9xcb1i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit d4716b1e33057f9fc016debc4d35e2cad198a068 forgot to update hash of
 > license file. This file was updated with a "MIT License" line:
 > https://github.com/SCons/scons/commit/3243305c08dd93b16ae0024780a38ad51dacd5e1

 > Fixes:
 >  - http://autobuild.buildroot.org/results/43547a6015cbd0db7a9e8e7bbe7c60029db20511

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
