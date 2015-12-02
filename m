From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 2 Dec 2015 18:02:00 -0300
Subject: [Buildroot] [PATCH 1/9] wireshark: forcibly disable lua
In-Reply-To: <20151202205706.GA5773@free.fr>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 <20151202205706.GA5773@free.fr>
Message-ID: <565F5C48.7040201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/15 17:57, Yann E. MORIN wrote:

> However, why not conditionally add it, like o:
>
> ifeq ($(BR2_PACKAGE_LUA),y)
> WIRESHARK_DEPENDENCIES += lua
> else
> WIRESHARK_CONF_OPTS += --with-lua=no
> endif
>
> Regards,
> Yann E. MORIN.

Hi Yann.
Because i didn't care in testing/enabling it and it may not work with 
all the lua versions we've got.
Regards.
