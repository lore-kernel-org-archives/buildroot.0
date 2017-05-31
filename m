From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:15:15 +0200
Subject: [Buildroot] [PATCH v2 1/4] erlang-jiffy: New package
In-Reply-To: <20170531163545.23552-1-johan.oudinet@gmail.com>
References: <20170531163545.23552-1-johan.oudinet@gmail.com>
Message-ID: <20170531211515.5b9af1e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 May 2017 18:35:42 +0200, Johan Oudinet wrote:

> +ERLANG_JIFFY_VERSION = 0.14.8
> +ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
> +ERLANG_JIFFY_LICENSE = MIT (core), BSD-3-Clause (Google double \
> +conversion library), BSD-3-Clause (tests)

I've adjusted the line splitting to be more logical (IMO) :

ERLANG_JIFFY_LICENSE = MIT (core), \
        BSD-3-Clause (Google double conversion library), \
        BSD-3-Clause (tests)

Applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
