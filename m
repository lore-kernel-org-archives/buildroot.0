From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 12:03:15 +0200
Subject: [Buildroot] [PATCH] upmpdcli: needs gcc >= 4.9
In-Reply-To: <20170622060138.6449-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Thu, 22 Jun 2017 08:01:38 +0200")
References: <20170622060138.6449-1-joerg.krause@embedded.rocks>
Message-ID: <87tw38ibks.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Commit 5d043799cd changed the dependency for libupnpp on GCC to 4.9, but
 > did not propagate the dependency to upmpdcli.

 > Fixes:
 > http://autobuild.buildroot.net/results/df2/df23cd5e77f61caf3f30cf43c91bc161a88def3a/

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
