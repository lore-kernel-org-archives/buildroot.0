From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Sep 2017 22:23:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/openobex: disable doc build
In-Reply-To: <20170926172040.25551-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 26 Sep 2017 19:20:40 +0200")
References: <20170926172040.25551-1-bernd.kuhls@t-online.de>
Message-ID: <87d16aincz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Openobex would need the host variant of xmlint (provided by host-
 > libxml2) to build the documentation.
 > To avoid this dependency we disable the build of the documentation.

 > Fixes
 > http://autobuild.buildroot.net/results/668/668ffb15f8c4faf0f4c462488dbb70b61386d465/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
