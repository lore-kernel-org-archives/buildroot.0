From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 10:31:09 +0100
Subject: [Buildroot] [PATCH] package/python-pytest: bump to version 6.1.2
In-Reply-To: <20201212152708.54248-1-m.niestroj@grinn-global.com>
References: <20201212152708.54248-1-m.niestroj@grinn-global.com>
Message-ID: <20201213103109.068f9ba6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Dec 2020 16:27:08 +0100
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> python-more-itertools was removed as dependency starting from
> [1] (release 6.1.0).
> 
> XML module is now a hard requirement.
> 
> [1] https://github.com/pytest-dev/pytest/commit/96a48f0c66ebe1ec2305c21390a3f6c059760af5
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/python-pytest/Config.in          | 2 +-
>  package/python-pytest/python-pytest.hash | 4 ++--
>  package/python-pytest/python-pytest.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
