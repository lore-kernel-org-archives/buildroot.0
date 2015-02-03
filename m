From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:55:17 +0100
Subject: [Buildroot] [PATCH v6 13/16] erlang-p1-sip: new package.
In-Reply-To: <1421055140-5092-14-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
 <1421055140-5092-14-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150203105517.71a1a9ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 12 Jan 2015 10:32:17 +0100, Johan Oudinet wrote:

> +ERLANG_P1_SIP_VERSION = bba4459
> +ERLANG_P1_SIP_SITE = $(call github,processone,p1_sip,$(ERLANG_P1_SIP_VERSION))
> +ERLANG_P1_SIP_LICENSE = GPLv2

License is GPLv2 with OpenSSL exception. Applied with this fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
