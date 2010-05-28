From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 May 2010 12:19:10 +0200
Subject: [Buildroot] git access via http
In-Reply-To: <AB12B32E73474741A2C5361C433A44DE01CD4EEB@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
	(Phil Edworthy's message of "Thu, 27 May 2010 09:50:55 +0100")
References: <AB12B32E73474741A2C5361C433A44DE01CD4EEB@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
Message-ID: <87typstjkx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Phil" == Phil Edworthy <Phil.Edworthy@renesas.com> writes:

 Phil> Hi,
 Phil> I just tried cloning the Buildroot repo via http but git just sits there
 Phil> after printing out "Initialized empty Git repository in
 Phil> /home/user/buildroot/.git/"

 Phil> I'm using git 1.6.6 and have no problems accessing github repos via http.
 Phil> Any ideas why this doesn't work?

Hmm, seems like git-over-http was never set up by the osuosl.org
people. Is this important for you? The native git protocol is a lot
better.

-- 
Bye, Peter Korsgaard
