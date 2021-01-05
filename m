From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 16:10:52 +0100
Subject: [Buildroot] [PATCH] boot/barebox: kconfig needs the toolchain
In-Reply-To: <20201208101107.32758-1-jmaselbas@kalray.eu> (Jules Maselbas via
 buildroot's message of "Tue, 8 Dec 2020 11:11:07 +0100")
References: <20201208101107.32758-1-jmaselbas@kalray.eu>
Message-ID: <87ble38lmr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jules" == Jules Maselbas via buildroot <buildroot@busybox.net> writes:

 > In barebox v2020.09.0, kconfig has been updated to a newer version
 > based on Linux 5.9-rc2.  As in linux, kconfig can call the compiler
 > to test its capabilities.

 > Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
