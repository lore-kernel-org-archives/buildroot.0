From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:36:04 +0100
Subject: [Buildroot] [PATCH 06/14] erlang-p1-xmpp: Bump to version 1.1.16
In-Reply-To: <20180116140649.7381-7-johan.oudinet@gmail.com>
References: <20180116140649.7381-1-johan.oudinet@gmail.com>
 <20180116140649.7381-7-johan.oudinet@gmail.com>
Message-ID: <20180117223604.5a2c649c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 15:06:41 +0100, Johan Oudinet wrote:

>  	depends on BR2_INSTALL_LIBSTDCPP # erlang-p1-stringprep
>  	select BR2_PACKAGE_ERLANG_P1_XML
>  	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
> +        select BR2_PACKAGE_ERLANG_P1_UTILS

Bah indentation here: it was indented with spaces and not a tab. This
is the type of minor mistake that ./utils/check-package verifies.

I've fixed this when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
