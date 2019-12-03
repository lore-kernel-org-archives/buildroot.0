From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Dec 2019 08:57:31 +0100
Subject: [Buildroot] [PATCH v1 3/4] package/docker-engine: bump to
 19.03.5
In-Reply-To: <20191203045003.145746-3-christian@paral.in>
References: <20191203045003.145746-1-christian@paral.in>
 <20191203045003.145746-3-christian@paral.in>
Message-ID: <20191203085731.6d12aa82@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Mon,  2 Dec 2019 20:50:02 -0800
Christian Stewart <christian@paral.in> wrote:

> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  ...ix-faulty-runc-version-commit-scrape.patch | 45 -------------------
>  package/docker-engine/docker-engine.hash      |  2 +-
>  package/docker-engine/docker-engine.mk        |  2 +-
>  3 files changed, 2 insertions(+), 47 deletions(-)
>  delete mode 100644 package/docker-engine/0001-Fix-faulty-runc-version-commit-scrape.patch

A quick question: did you check that the test_docker_compose.py test we
have in Buildroot continues to work with this series applied ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
