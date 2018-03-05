From: Alexander Dahl <post@lespocky.de>
Date: Mon, 5 Mar 2018 09:42:44 +0100
Subject: [Buildroot] [PATCH] mosquitto: unbreak build with websockets
 and !libopenssl
In-Reply-To: <87lgf77xke.fsf@dell.be.48ers.dk>
References: <20180303101545.11446-1-peter@korsgaard.com>
 <87vaedb0bz.fsf@dell.be.48ers.dk>
 <20180305075851.qi7x46yj7swdge6b@falbala.home.lespocky.de>
 <87lgf77xke.fsf@dell.be.48ers.dk>
Message-ID: <20180305084244.q5q7gm2nbazhc5ae@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Mon, Mar 05, 2018 at 09:09:53AM +0100, Peter Korsgaard wrote:
> It would certainly be nicer if other people would review the patch, but
> given how obvious it is and how close we were to the release I opted to
> apply it myself.

Understood.

> Are you interested in mosquitto? If so, please add an entry to
> DEVELOPERS for it and I'll ensure I CC you on future patches to it.

In general I'm interested in mosquitto, I added a package for ptxdist
[1] last year, which is a requirement for a mosquitto based
mqtt-library [2] I'm working on in my spare time, but currently I have
no usecase to use it with buildroot. Maybe later, if I decide it would
be useful on the fli4l [3] router in the hackerspace I'm member of. I
can send a patch to add myself then. O:-)

Have a nice day.
Alex

[1] https://git.pengutronix.de/cgit/ptxdist/commit/?id=8201e3d29e950e713f755ec4e864ce0869bdd060
[2] https://github.com/penguineer/mqtt-tools
[3] https://www.fli4l.de/

-- 
?With the first link, the chain is forged. The first speech censured, 
the first thought forbidden, the first freedom denied, chains us all 
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: C28E E6B9 0263 95CF 8FAF  08FA 34AD CD00 7221 5CC6 ***
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180305/e7dcd57c/attachment.asc>
