From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 22:43:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 3.2.5
In-Reply-To: <20210714085044.2455236-1-fontaine.fabrice@gmail.com>
References: <20210714085044.2455236-1-fontaine.fabrice@gmail.com>
Message-ID: <20210715224359.13d9a0f4@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 14 Jul 2021 10:50:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2021-35042: Django 3.1.x before 3.1.13 and 3.2.x before 3.2.5
> allows QuerySet.order_by SQL injection if order_by is untrusted input
> from a client of a web application.
> 
> https://www.djangoproject.com/weblog/2021/jul/01/security-releases
> https://docs.djangoproject.com/en/dev/releases/3.2.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
