From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:33:20 +0200
Subject: [Buildroot] [PATCH 0/6] Python improvements: PEP 3147 fix and
 misc updates
In-Reply-To: <1412113141-17650-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412113141-17650-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141005143320.1cb1ba06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Sep 2014 23:38:55 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (6):
>   python3: add distutils fix for PEP 3147 issue
>   python3: remove unneeded __pycache__ directories
>   python-pyparsing: bump to version 2.0.2, enable on Python 3
>   python-setuptools: bump to version 5.8
>   python-pyasn: requires the zlib Python module
>   python, python3: convert py/pyc removal to TARGET_FINALIZE_HOOKS

I've applied this patch series.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
