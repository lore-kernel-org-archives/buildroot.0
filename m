From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Oct 2017 22:41:56 +0200
Subject: [Buildroot] [PATCH] shairport-sync: bump to version 3.1.3
In-Reply-To: <20171004082436.10105-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 4 Oct 2017 10:24:36 +0200")
References: <20171004082436.10105-1-joerg.krause@embedded.rocks>
Message-ID: <87fuaxgwdn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Fixes a runtime startup issue on SysV init systems:
 > ```
 > # shairport-sync -d
 > Daemon returned 2 as return value.
 > ```

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
