From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 08:45:26 +0200
Subject: [Buildroot] [PATCH] package/gerbera: fix pidfile name in
 start-stop-script
In-Reply-To: <20190516082542.28530-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Thu, 16 May 2019 10:25:42 +0200")
References: <20190516082542.28530-1-joerg.krause@embedded.rocks>
Message-ID: <87d0jrw6t5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > `NAME` is not set resulting in a pidfile without a basename:
 > `/var/run/.pid`. Use the correct variable `DAEMON` instead.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
