From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 06:52:41 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libsexy
In-Reply-To: <20090127002646.GA1083@cloud.net.au> (Hamish Moffatt's message of
	"Tue\, 27 Jan 2009 11\:26\:46 +1100")
References: <20090123174850.A9B52769CC@busybox.osuosl.org>
	<87mydhkgdx.fsf@macbook.be.48ers.dk>
	<20090127002646.GA1083@cloud.net.au>
Message-ID: <87k58h2t3q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

 >> But from doing a quick grep in the libsexy sources I don't see
 >> any X includes, so are you sure it doesn't work with
 >> gtk-over-directfb?

 Hamish> Also, remember that X is client/server and lack of an X
 Hamish> server doesn't mean you can't run any X clients.

True, but there wasn't actually any X dependency at all. With current
trunk it builds under gtk/directfb as well.

-- 
Bye, Peter Korsgaard
