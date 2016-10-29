From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:57:46 +0200
Subject: [Buildroot] [PATCH 11/11] qt: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1477660709-5935-11-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1477660709-5935-11-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20161029155746.1de6931c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Oct 2016 10:18:29 -0300, gustavo.zacarias at free-electrons.com
wrote:

> -		$(QT_CONFIGURE_ENV) \
> +		$(TARGET_MAKE_ENV) \

It would have been good to indicate in the commit log why you're
dropping QT_CONFIGURE_ENV here. After checking that it's indeed never
defined, I've amended the commit log accordingly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
