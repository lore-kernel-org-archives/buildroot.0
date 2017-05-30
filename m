From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 00:08:57 +0200
Subject: [Buildroot] [PATCH 14/16] erlang-p1-oauth: New package
In-Reply-To: <20170530145211.15320-15-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
 <20170530145211.15320-15-johan.oudinet@gmail.com>
Message-ID: <20170531000857.331cee23@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 16:52:09 +0200, Johan Oudinet wrote:
> OAuth2 library for Erlang
> https://github.com/processone/p1_oauth2
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Missing change to the DEVELOPERS file.

> +	  https://github.com/processone/p1_oauth2

This URL exists.

> +ERLANG_P1_OAUTH_VERSION = 0.6.1
> +ERLANG_P1_OAUTH_SITE = $(call github,processone,p1_oauth,$(ERLANG_P1_OAUTH_VERSION))

But I don't see how this URL (which is different) can actually work.
Isn't there a typo here?

Should the package be named erlang-p1-oauth2 instead ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
