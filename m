From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 23:35:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-yatl: new package
In-Reply-To: <20200611205607.1869425-1-fontaine.fabrice@gmail.com>
References: <20200611205607.1869425-1-fontaine.fabrice@gmail.com>
Message-ID: <20200618233510.38eadb22@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Jun 2020 22:56:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> License is BSD-3-Clause as stated in upstream LICENSE.txt:
> https://github.com/web2py/yatl/blob/master/LICENSE.txt
> 
> An issue was opened to add LICENSE.txt in pypi tarballs:
> https://github.com/web2py/yatl/issues/21
> 
> Add host variant as it will be needed for python-web2py
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/python-yatl/Config.in        |  6 ++++++
>  package/python-yatl/python-yatl.hash |  3 +++
>  package/python-yatl/python-yatl.mk   | 14 ++++++++++++++
>  5 files changed, 25 insertions(+)
>  create mode 100644 package/python-yatl/Config.in
>  create mode 100644 package/python-yatl/python-yatl.hash
>  create mode 100644 package/python-yatl/python-yatl.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
