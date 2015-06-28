From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 16:14:33 +0200
Subject: [Buildroot] [PATCH 2/3] python-robotframework: New package
In-Reply-To: <1434362765-1074-3-git-send-email-denis.thulin@openwide.fr>
References: <1434362765-1074-1-git-send-email-denis.thulin@openwide.fr>
 <1434362765-1074-3-git-send-email-denis.thulin@openwide.fr>
Message-ID: <20150628161433.3b075437@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Denis THULIN,

On Mon, 15 Jun 2015 12:06:04 +0200, Denis THULIN wrote:

> diff --git a/package/python-robotframework/Config.in b/package/python-robotframework/Config.in
> new file mode 100644
> index 0000000..fe95eea
> --- /dev/null
> +++ b/package/python-robotframework/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_ROBOTFRAMEWORK
> +	depends on BR2_PACKAGE_PYTHON

So it only works with Python 2. What about using
https://pypi.python.org/pypi/robotframework-python3 instead, which
seems to support both Python 2 and Python 3 ? Or maybe this is not an
"official" version ?

I'll mark your patch as Changes Requested in patchwork. Can you resend
an updated version that takes into account the comments from Arnout?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
