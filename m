From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:57:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/mpd: drop dependency on libglib2
In-Reply-To: <20170115203435.908-2-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sun, 15 Jan 2017 21:34:35 +0100")
References: <20170115203435.908-1-joerg.krause@embedded.rocks>
 <20170115203435.908-2-joerg.krause@embedded.rocks>
Message-ID: <878tqbcgcw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Version 0.20.x does not depend on libglib2 anymore. Note, that the
 > dependency on MMU and Thread remain, as MPD uses fork() and thread
 > functionality.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
