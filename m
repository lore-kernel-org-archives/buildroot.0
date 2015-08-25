From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Aug 2015 22:28:37 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
In-Reply-To: <55DB7994.8080509@mind.be> (Arnout Vandecappelle's message of
 "Mon, 24 Aug 2015 22:07:48 +0200")
References: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
 <20150823163653.3989f210@free-electrons.com>
 <20150823153737.GD3729@free.fr>
 <20150823205857.1625a64f@free-electrons.com>
 <55DB7994.8080509@mind.be>
Message-ID: <87vbc3xgcq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  I'm not going to comment on all the points made here, but my stance
 > is: lthough I also hate what the wf111 package does, I don't think
 > it's bad enough to remove it from buildroot. It doesn't hurt the rest
 > of buildroot at all, and it is a useful package for some users. I'd
 > rather get rid of sparc than getting rid of this package.

I'm with Arnout here. While the download/binary blobs issues certainly
aren't nice (and perhaps we would have had second thoughts when it was
submitted if we had known about these issues), the fact is that it is in
the tree today, people are using it and it doesn't cause any real
problems for us - So I suggest we keep it.

-- 
Bye, Peter Korsgaard
