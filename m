From: Rob Landley <rob@landley.net>
Date: Wed, 20 Sep 2006 19:42:57 -0400
Subject: [Buildroot] can't resolve symbol bcopy
In-Reply-To: <20060920162406.GA9098@aon.at>
References: <e068c5c30609200634i6b222c86r298f1fabe57a3049@mail.gmail.com>
	<20060920162406.GA9098@aon.at>
Message-ID: <200609201942.57816.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 20 September 2006 12:24 pm, Bernhard Fischer wrote:
> Only recently one instance of bzero was erroneously added to busybox:
> http://www.busybox.net/lists/busybox/2006-September/024328.html

As the message you linked to showed, it was quite intentional.

If you'd like to support the assertion that memset() and bzero() produce equal 
size binaries, feel free to give me bloatcheck runs.

Rob
-- 
Never bet against the cheap plastic solution.
