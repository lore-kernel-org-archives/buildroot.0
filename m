From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 19:47:49 +0200
Subject: [Buildroot] [PATCH 1/1] Added libpam-tacplus and
 libpam-radius-auth modules.
In-Reply-To: <1439999586-6811-1-git-send-email-giovanni.zantedeschi@datacom.ind.br>
References: <1439999586-6811-1-git-send-email-giovanni.zantedeschi@datacom.ind.br>
Message-ID: <20150819194749.599129ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear giovanni.zantedeschi,

On Wed, 19 Aug 2015 12:53:06 -0300, giovanni.zantedeschi wrote:
> From: "Giovanni Zantedeschi" <giovanni.zantedeschi@datacom.ind.br>
> 
> Signed-off-by: Giovanni Zantedeschi <giovanni.zantedeschi@datacom.ind.br>
> ---
>  package/Config.in                                |  2 ++
>  package/libpam-radius-auth/Config.in             |  6 ++++++
>  package/libpam-radius-auth/libpam-radius-auth.mk | 25 ++++++++++++++++++++++++
>  package/libpam-tacplus/Config.in                 |  5 +++++
>  package/libpam-tacplus/libpam-tacplus.mk         | 18 +++++++++++++++++

Thanks for this patch. However, since it is adding two different
packages, could you split it in two patches? Their title should be:

	libpam-tacplus: new package
	libpam-radius-auth: new package

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
