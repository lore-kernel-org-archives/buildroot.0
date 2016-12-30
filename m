From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Dec 2016 22:44:46 +0100
Subject: [Buildroot] [PATCH 1/3] package/busybox: update configuration
	file
In-Reply-To: <20161229202340.22374-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Thu, 29 Dec 2016 21:23:38 +0100")
References: <20161229202340.22374-1-joerg.krause@embedded.rocks>
Message-ID: <8737h5852p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Commit 44a563dbc04ec8e51c5262201cd1745617055b78 bumps busybox to version
 > 1.26.0, but does not update the configuration file. There is at least
 > one issue using the old configuration with the newer busybox:

 > * IFUPDOWN is split into IFUP and IFDOWN in version 1.26.0

 > Update the configuration file by loading the busybox.config file and
 > saving it back.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
