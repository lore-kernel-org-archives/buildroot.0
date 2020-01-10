From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 09:39:49 +0100
Subject: [Buildroot] [PATCH 1/2] package/docker-containerd: bump to 1.3.2
In-Reply-To: <20200110045033.1920685-1-christian@paral.in> (Christian
 Stewart's message of "Thu, 9 Jan 2020 20:50:32 -0800")
References: <20200110045033.1920685-1-christian@paral.in>
Message-ID: <87pnfrg0x6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Signed-off-by: Christian Stewart <christian@paral.in>

Can you provide a more detailed commit message, please?

In the past we have matched the runc and containerd versions with what
upstream uses for docker-ce.

What does this bring when used with docker-engine 19.03? Is it
compatible?


 > ---
 >  package/docker-containerd/docker-containerd.hash | 4 ++--
 >  package/docker-containerd/docker-containerd.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
 > index aad74089e9..e870e42996 100644
 > --- a/package/docker-containerd/docker-containerd.hash
 > +++ b/package/docker-containerd/docker-containerd.hash
 > @@ -1,3 +1,3 @@
 >  # Computed locally
 > -sha256	6a4192fced10c390373adfa9fa9a4f12fe9f38bde580d90468a79ed6c8af75ee  docker-containerd-1.2.11.tar.gz
 > -sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
 > +sha256 1ac07660f693aac0df48638090e1c528a056dbe19c4136bbe0c74fa865399b96  docker-containerd-1.3.2.tar.gz
 > +sha256 4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
 > diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
 > index 69068e44f8..90601c58fa 100644
 > --- a/package/docker-containerd/docker-containerd.mk
 > +++ b/package/docker-containerd/docker-containerd.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -DOCKER_CONTAINERD_VERSION = 1.2.11
 > +DOCKER_CONTAINERD_VERSION = 1.3.2
 >  DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 >  DOCKER_CONTAINERD_LICENSE = Apache-2.0
 >  DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
 > -- 
 > 2.24.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
