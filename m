From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:04:35 +0100
Subject: [Buildroot] [PATCH 5/6] configs/orangepi_zero_plus2: U-Boot
 needs pylibfdt
In-Reply-To: <20181122094150.10403-5-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 22 Nov 2018 10:41:48 +0100")
References: <20181122094150.10403-1-thomas.petazzoni@bootlin.com>
 <20181122094150.10403-5-thomas.petazzoni@bootlin.com>
Message-ID: <87h8g3vkgs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When building U-Boot for this platform:
 > unable to execute 'swig': No such file or directory
 > error: command 'swig' failed with exit status 1
 > scripts/dtc/pylibfdt/Makefile:26: recipe for target 'scripts/dtc/pylibfdt/_libfdt.so' failed

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/123771103

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
