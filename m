From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 Sep 2012 11:40:39 -0300
Subject: [Buildroot] Python running very slow with buildroot 2012.05
In-Reply-To: <20120906163440.69c585eb@skate>
References: <1346940241.6846.YahooMailNeo@web110707.mail.gq1.yahoo.com>
 <20120906161509.2f5fc914@skate>
 <1346941637.60509.YahooMailNeo@web110712.mail.gq1.yahoo.com>
 <20120906163440.69c585eb@skate>
Message-ID: <5048B5E7.7050002@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/06/12 11:34, Thomas Petazzoni wrote:

> Is is reproducible even after the first run? Are you running the same
> kernel, with the same configuration? Your two environments are really
> different, so it's very difficult to make correct comparisons and draw
> conclusions from them.

Exactly where i was going to point to.
He's basically measuring startup time, not a benchmark per se.
Also if, say, the main system is already running something with the
exact same glibc it's already preloaded, whereas if it's the first/only
thing uclibc-based it gets all the penalties, even after the first run.
Regards.
