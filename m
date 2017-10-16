From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:58:45 +0200
Subject: [Buildroot] [PATCH 1/3] package/softether: fix hash
In-Reply-To: <20170920104143.21404-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 20 Sep 2017 12:41:41 +0200")
References: <20170920104143.21404-1-bernd.kuhls@t-online.de>
Message-ID: <87y3oapxey.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The tarball downloaded today from github does not match the checksum
 > which once was valid.

 > Comparing both
 > https://github.com/SoftEtherVPN/SoftEtherVPN/archive/1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a/softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
 > http://sources.buildroot.net/softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
 > shows no differences in content.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
