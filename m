From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:00:07 +0200
Subject: [Buildroot] [PATCH] upmpdcli: add user to the audio group
In-Reply-To: <20170324084743.1233-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Fri, 24 Mar 2017 09:47:43 +0100")
References: <20170324084743.1233-1-joerg.krause@embedded.rocks>
Message-ID: <87wpb6x760.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > upmpdcli runs as user and group upmpdcli. In order to allow it to access
 > the ALSA devices add it to the audio group.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
