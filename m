From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 09 Oct 2016 21:20:13 +0200
Subject: [Buildroot] gc20 no space left issue
In-Reply-To: <20161009204509.49fc7a4b@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 9 Oct 2016 20:45:09 +0200")
References: <20161009204509.49fc7a4b@free-electrons.com>
Message-ID: <87vax1ib2q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello Peter,
 > Due to a lack of disk space, gcc20 reports some build failures, such as:

 >   http://autobuild.buildroot.net/results/6a2/6a2d4cb453128c0aa1fc9ed0ac04ec7c8306e7e1/

 > Could you see if you can fix this ?

I dropped some of the bigger tarballs from instance-*/dl, so now there's
11G free.

 > Perhaps we should start thinking about a way of ignoring the build
 > results caused by a lack of disk space ?

Perhaps, if we can come up with a simple & robust way of detecting
it. On the other hand, this doesn't happen that often - And when it does
it is good to get notified about it.

-- 
Bye, Peter Korsgaard
