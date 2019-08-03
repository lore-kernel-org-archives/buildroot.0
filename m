From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 10:40:02 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/rpi-firmware: bump version
 for pi4 support
In-Reply-To: <20190629183240.16035-1-michael@michaelcullen.name> (Michael
 Cullen's message of "Sat, 29 Jun 2019 19:32:37 +0100")
References: <20190629183240.16035-1-michael@michaelcullen.name>
Message-ID: <87zhkqod5p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Cullen <michael@michaelcullen.name> writes:

 > This commit pulls in the latest version of rpi-firmware to enable
 > support for the new Pi4

 > Additionally, it copies the RPi4 start files if selected.

 > Signed-off-by: Michael Cullen <michael@michaelcullen.name>

 > ---
 > Changes V1 -> V2:
 > * reworked boot file installation to properly install the pi4 files
 >   and only the pi4 files

Committed with some minor rewording / rework, thanks.

-- 
Bye, Peter Korsgaard
