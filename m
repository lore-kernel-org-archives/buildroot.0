From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:46:04 +0200
Subject: [Buildroot] [PATCH 2/3] Add Dockerfile for CI
In-Reply-To: <20170702161324.485-2-arnout@mind.be>
References: <20170702161324.485-1-arnout@mind.be>
 <20170702161324.485-2-arnout@mind.be>
Message-ID: <20170702234604.77dc320e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Jul 2017 18:13:23 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> For Gitlab-CI, we want to avoid re-generating the minimal install to
> be able to run tests all the time. So let's create a docker image that
> we can post on Docker Hub and then pull.
> 
> For the time being, this is just what we need for running our CI. Later
> we can produce something that is also useful for users.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/docker/Dockerfile | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 support/docker/Dockerfile

Applied to master, thanks. Will you provide an update to the Buildroot
manual, documenting this next to the Vagrant stuff?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
