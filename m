From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:00:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-requests: bump to
 version 2.23.0
In-Reply-To: <20200416102713.110388-1-james.hilliard1@gmail.com>
References: <20200416102713.110388-1-james.hilliard1@gmail.com>
Message-ID: <20200417220013.67f452e7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Apr 2020 04:27:13 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch that is now upstream.
> 
> License hash change is due to date change in upstream commit:
> https://github.com/psf/requests/commit/a29be8f9ccf13c887e0f8861c2a35fb5289b9e3f
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...ncies-to-major-instead-of-minor-5342.patch | 40 -------------------
>  package/python-requests/python-requests.hash  |  6 +--
>  package/python-requests/python-requests.mk    |  4 +-
>  3 files changed, 5 insertions(+), 45 deletions(-)
>  delete mode 100644 package/python-requests/0001-Limit-dependencies-to-major-instead-of-minor-5342.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
