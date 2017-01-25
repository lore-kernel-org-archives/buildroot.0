From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 14:21:19 +1300
Subject: [Buildroot] [PATCH 1/3] python-babel: new package
In-Reply-To: <20170124144347.19723-1-lionel@svkt.org>
References: <20170124144347.19723-1-lionel@svkt.org>
Message-ID: <20170125142119.18c29014@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Jan 2017 15:43:45 +0100, Lionel Flandrin wrote:
> A collection of tools for internationalizing Python applications.
> 
> Signed-off-by: Lionel Flandrin <lionel@svkt.org>
> ---
>  package/Config.in                      |  1 +
>  package/python-babel/Config.in         |  8 ++++++++
>  package/python-babel/python-babel.hash |  3 +++
>  package/python-babel/python-babel.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-babel/Config.in
>  create mode 100644 package/python-babel/python-babel.hash
>  create mode 100644 package/python-babel/python-babel.mk

All three patches applied to master. Thanks for the patches, and thanks
Yegor for the review!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
