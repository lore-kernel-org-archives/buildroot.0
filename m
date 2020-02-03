From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 12:33:51 +0100
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 3.0.3
In-Reply-To: <20200203112822.4250-1-peter@korsgaard.com>
References: <20200203112822.4250-1-peter@korsgaard.com>
Message-ID: <20200203123351.2024188f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  3 Feb 2020 12:28:21 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2020-7471: Potential SQL injection via StringAgg(delimiter)
>   django.contrib.postgres.aggregates.StringAgg aggregation function was
>   subject to SQL injection, using a suitably crafted delimiter.
> 
> For more details, see the advisory:
> https://www.djangoproject.com/weblog/2020/feb/03/security-releases/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
