From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:15:57 +0200
Subject: [Buildroot] [PATCH 1/1] mono: remove copy of host etc files on
	install
In-Reply-To: <CA+TH9Vnt+rUA3ECViAMXYwg4sFHyV=vYp+-1RQW631n3hprjgA@mail.gmail.com>
 (Angelo Compagnucci's message of "Mon, 22 May 2017 16:52:06 +0200")
References: <20170315022458.14160-1-dustin.r.johnson@gmail.com>
 <CA+TH9Vnt+rUA3ECViAMXYwg4sFHyV=vYp+-1RQW631n3hprjgA@mail.gmail.com>
Message-ID: <87fufjlroi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > 2017-03-15 3:24 GMT+01:00 Dustin Johnson <dustin.r.johnson@gmail.com>:
 >> When the mono package is installed, the autotools installer installs
 >> the /etc/mono files to the target. A post_install hook then copies
 >> over the mono libraries to the target as well as the host /etc/mono
 >> files which overrides the target files. The target specific mono
 >> configuration file (/etc/mono/config) is overridden with the host
 >> settings. This causes mono on the target to be unable to locate target
 >> specific .so files as it overrides the changes enacted by the patches
 >> for the package.
 >> 
 >> Signed-off-by: Dustin Johnson <dustin.r.johnson@gmail.com>
 > Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 > Reviewed-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 > Acked-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
