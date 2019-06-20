From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 22:03:00 +0200
Subject: [Buildroot] [PATCH 2/6] package/python-iptables: new package
In-Reply-To: <20190531171654.17906-2-matthew.weber@rockwellcollins.com>
References: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
 <20190531171654.17906-2-matthew.weber@rockwellcollins.com>
Message-ID: <20190620220300.7d402e51@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 May 2019 12:16:50 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> This package provides Python bindings for iptables.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

I have applied, after doing one change, see below.

> +PYTHON_IPTABLES_VERSION = 0.13.0
> +PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/6e/3a/866f5b1bccc6a4d94811f84304d700da14518ff55b80e08ff2241b3221bf
> +PYTHON_IPTABLES_SETUP_TYPE = setuptools
> +PYTHON_IPTABLES_LICENSE = Apache-2.0

The tarball does contain a license file called NOTICE, so I've added
that + its hash.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
