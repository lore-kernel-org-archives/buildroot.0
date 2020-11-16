From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 17:17:23 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: drop Trent Piepho
In-Reply-To: <20201116130808.748933-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 16 Nov 2020 14:08:08 +0100")
References: <20201116130808.748933-1-thomas.petazzoni@bootlin.com>
Message-ID: <87eekt5l9o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > We change Trent's e-mail address in commit
 > 1c20802d4b5de5836b2ab6000a4c5e273711a8aa, but it turns out the new one
 > also doesn't work:

 > <trent.piepho@synapse.com>: host
 >     synapse-com.mail.protection.outlook.com[104.47.57.138] said: 550 5.4.1
 >     Recipient address rejected: Access denied. AS(201806281)
 >     [DM6NAM11FT063.eop-nam11.prod.protection.outlook.com] (in reply to RCPT TO
 >     command)

 > So let's drop Trent entirely, which orphans the libp11 package.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
