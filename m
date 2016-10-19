From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 09:50:13 +0200
Subject: [Buildroot] [PATCH 1/3] runc: bump version to v1.0.0-rc2
In-Reply-To: <1476852805-11450-1-git-send-email-christian@paral.in> (Christian
 Stewart's message of "Wed, 19 Oct 2016 00:53:23 -0400")
References: <1476852805-11450-1-git-send-email-christian@paral.in>
Message-ID: <877f94g4lm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Signed-off-by: Christian Stewart <christian@paral.in>

Great, I was just looking at updating our docker packages yesterday.

Committed series, thanks. I see that our docker setup doesn't work out
of the box (E.G. docker needs a number of kernel options like cgroups
and netfilter, runtime dependencies like iptables and there is no init
script starting up dockerd / ensuring /var/lib/docker exists, ..).

Is that something you could work on?

-- 
Bye, Peter Korsgaard
