From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:31:44 +0200
Subject: [Buildroot] [PATCH 3/5] package/python-pylru: new package
In-Reply-To: <20161006044858.27768-3-bernd.kuhls@t-online.de>
References: <20161006044858.27768-1-bernd.kuhls@t-online.de>
 <20161006044858.27768-3-bernd.kuhls@t-online.de>
Message-ID: <20161007153144.5c2f4aa3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Oct 2016 06:48:56 +0200, Bernd Kuhls wrote:

> +PYTHON_PYLRU_VERSION = 1.0.9
> +PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
> +PYTHON_PYLRU_SITE = https://pypi.python.org/packages/c0/7d/0de1055632f3871dfeaabe5a3f0510317cd98b93e7b792b44e4c7de2b17b
> +PYTHON_PYLRU_SETUP_TYPE = distutils
> +PYTHON_PYLRU_LICENSE = GNU General Public License (GPL)

License should be "GPLv2".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
