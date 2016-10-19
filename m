From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 09:53:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add option for
	static client
In-Reply-To: <1476850246-12883-1-git-send-email-christian@paral.in> (Christian
 Stewart's message of "Wed, 19 Oct 2016 00:10:46 -0400")
References: <1476850246-12883-1-git-send-email-christian@paral.in>
Message-ID: <8737jsg4fn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Adds an option to selectively enable a static client.
 > This is useful when bind-mounting the docker client binary into
 > containers for a docker-in-docker setup.

 > Signed-off-by: Christian Stewart <christian@paral.in>

What is the use case for docker-in-docker? Why not bind mount
/var/run/docker.sock instead?

-- 
Bye, Peter Korsgaard
