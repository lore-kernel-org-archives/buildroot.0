From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 19:26:21 +0100
Subject: [Buildroot] [PATCH] python-django: security bump to version
 1.7.3
In-Reply-To: <1421259704-15174-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421259704-15174-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150114192621.61b48d0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Jan 2015 15:21:44 -0300, Gustavo Zacarias wrote:
> Fixes:
> 
> CVE-2015-0219 - incorrectly handled underscores in WSGI headers. A
> remote attacker could possibly use this issue to spoof headers in
> certain environments.
> 
> CVE-2015-0220 - incorrectly handled user-supplied redirect URLs. A
> remote attacker could possibly use this issue to perform a cross-site
> scripting attack.
> 
> CVE-2015-0221 - incorrectly handled reading files in
> django.views.static.serve(). A remote attacker could possibly use this
> issue to cause Django to consume resources, resulting in a denial of
> service.
> 
> CVE-2015-0222 - incorrectly handled forms with ModelMultipleChoiceField.
> A remote attacker could possibly use this issue to cause a large number
> of SQL queries, resulting in a database denial of service.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
