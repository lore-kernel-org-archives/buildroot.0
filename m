From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Feb 2020 11:47:30 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/docker-containerd: bump to
 1.2.12
In-Reply-To: <20200204231711.38205-1-christian@paral.in> (Christian Stewart's
 message of "Tue, 4 Feb 2020 15:17:11 -0800")
References: <20200204231711.38205-1-christian@paral.in>
Message-ID: <875zglwbst.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > containerd is now a separate CNCF sponsored project, and is no longer explicitly
 > associated with docker/moby.

 > This commit bumps to the latest bugfix release for 1.2.x.

 > Signed-off-by: Christian Stewart <christian@paral.in>

Hmm, looking at
https://github.com/containerd/containerd/releases/tag/v1.2.12 I see that
this fixes a number of security issues, so I've changed the commit
message to make that clear and committed.

For the future, please explicitly mention such security fixes in the
commit message.

-- 
Bye, Peter Korsgaard
