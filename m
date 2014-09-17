From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Sep 2014 14:03:41 +0200
Subject: [Buildroot] [PATCH 4/6] python-configshell-fb: new package
In-Reply-To: <1410953999-16520-5-git-send-email-cvubrugier@fastmail.fm>
References: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
 <1410953999-16520-5-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20140917140341.34d14957@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Wed, 17 Sep 2014 13:39:57 +0200, Christophe Vu-Brugier wrote:

> diff --git a/package/python-configshell-fb/Config.in b/package/python-configshell-fb/Config.in
> new file mode 100644
> index 0000000..05de585
> --- /dev/null
> +++ b/package/python-configshell-fb/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
> +	bool "python-configshell-fb"
> +	depends on BR2_PACKAGE_PYTHON

Ok, I just read the README file for this package, and it explains that
the setup.py script runs 2to3 to convert the package source code to
Python 3 if needed. Most likely our installation of 2to3 is broken.

The patch anyway looks good to me, so:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
