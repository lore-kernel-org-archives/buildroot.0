From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Mar 2018 09:09:53 +0100
Subject: [Buildroot] [PATCH] mosquitto: unbreak build with websockets
 and !libopenssl
In-Reply-To: <20180305075851.qi7x46yj7swdge6b@falbala.home.lespocky.de>
 (Alexander Dahl's message of "Mon, 5 Mar 2018 08:58:52 +0100")
References: <20180303101545.11446-1-peter@korsgaard.com>
 <87vaedb0bz.fsf@dell.be.48ers.dk>
 <20180305075851.qi7x46yj7swdge6b@falbala.home.lespocky.de>
Message-ID: <87lgf77xke.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:

 > Hello Peter,
 > On Sat, Mar 03, 2018 at 05:17:20PM +0100, Peter Korsgaard wrote:
 >> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> 
 >> > Fixes:
 >> > http://autobuild.buildroot.net/results/d69/d693f3e3f1c73ccf54ac7076623e436355a9d901/b
 >> 
 >> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> 
 >> Committed, thanks.

 > Do you thank yourself here? Doesn't that somehow circumvent a probably
 > desired review?

It would certainly be nicer if other people would review the patch, but
given how obvious it is and how close we were to the release I opted to
apply it myself.

Are you interested in mosquitto? If so, please add an entry to
DEVELOPERS for it and I'll ensure I CC you on future patches to it.

-- 
Bye, Peter Korsgaard
