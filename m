From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 21:53:19 +0200
Subject: [Buildroot] [PATCH 3/3] udftools: fix static linking against
 readline
In-Reply-To: <20180422212005.13062-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 22 Apr 2018 23:20:05 +0200")
References: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
 <20180422212005.13062-4-thomas.petazzoni@bootlin.com>
Message-ID: <87a7tcpnm8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > One program of udftools uses the readline library, but fails to build
 > in static linking configurations. In order to fix this, we teach
 > udftools configure.ac to use pkg-config to detect the readline
 > library, and to use the proper flags provided by pkg-config.

 > This obviously requires an autoreconf of the package, and the addition
 > of host-pkgconf in the dependencies.

 > Fixes:

 >   http://autobuild.buildroot.net/results/113a94049d89b8f065112e5d4482667a7b7fb843/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
