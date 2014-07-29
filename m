From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:22:02 +0200
Subject: [Buildroot] [PATCH] samba4: bump to version 4.1.10
In-Reply-To: <1406657724-21261-1-git-send-email-gustavo@zacarias.com.ar>
References: <1406657724-21261-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140729202202.6ca3c3f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 29 Jul 2014 15:15:24 -0300, Gustavo Zacarias wrote:
> Lots of bugfixes, enhancements to provisioning and printing support via cups.

None of the patches we have in package/samba4/ have been merged
upstream? Some of them are marked "Upstream", so I would have expected
them to be removed by this bump, no? Or maybe they've been applied to a
development branch that hasn't been released yet?

> +comment "Some samba4 CLI tools require the python package to keep .py files"
> +	depends on BR2_PACKAGE_SAMBA4 && BR2_PACKAGE_PYTHON_PYC_ONLY

That seems weird, could you elaborate a bit on that?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
