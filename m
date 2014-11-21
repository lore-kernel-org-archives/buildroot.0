From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 10:37:40 +0100
Subject: [Buildroot] [PATCH] czmq: fix static build
In-Reply-To: <b4686e4f4a1c32cb679db3cc7f2875556728e56c.1416549890.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 21 Nov 2014 08:04:50 +0200")
References: <b4686e4f4a1c32cb679db3cc7f2875556728e56c.1416549890.git.baruch@tkos.co.il>
Message-ID: <87wq6oq4gr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > czmq configure script uses gcc to test zmq linking so libstdc++ is not added
 > automatically. Do this manually.

 > Fixes:
 > http://autobuild.buildroot.net/results/7b7/7b7f7614206cf9b8fef48f49cb060eca356d4949/
 > http://autobuild.buildroot.net/results/b3a/b3abff021d23ef0f685a44901b6041ba45bd35d7/
 > http://autobuild.buildroot.net/results/1f0/1f033d04231c5f058513cbca0d437b96260fbd7a/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
