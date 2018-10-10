From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 14:29:35 +0200
Subject: [Buildroot] [PATCH 4/4] python-pysnmp: bump to version 4.4.6
In-Reply-To: <20180922193631.14369-4-asafka7@gmail.com>
References: <20180922193631.14369-1-asafka7@gmail.com>
 <20180922193631.14369-4-asafka7@gmail.com>
Message-ID: <20181010142935.497c974a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 22:36:31 +0300, Asaf Kahlon wrote:
> Update dependencies.
> License was renamed to LICENSE.rst (no content changed).
> Add hash for license.
> 
> Fixes:
> http://autobuild.buildroot.org/results/9b3/9b3bcd761aa35d9fdf4acc05258cc87e8c36fb14/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pysnmp/Config.in          | 9 +++------
>  package/python-pysnmp/python-pysnmp.hash | 8 +++++---
>  package/python-pysnmp/python-pysnmp.mk   | 8 +++-----
>  3 files changed, 11 insertions(+), 14 deletions(-)

Applied to master, thanks. Hopefully this is the last package that was
causing issues with Python 3.7.0. In any case, thanks a lot for all
your work in relation to the Python 3.7.0 update, it was much
appreciated.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
