From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:40:28 +0200
Subject: [Buildroot] [PATCH] package/erlang-jiffy: set version in
 jiffy.app.src
In-Reply-To: <20170604152918.13404-1-romain.naour@gmail.com>
References: <20170604152918.13404-1-romain.naour@gmail.com>
Message-ID: <20170605114028.2cb51c09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Jun 2017 17:29:18 +0200, Romain Naour wrote:

> +	$(SED) 's/{vsn, git}/{vsn, "${ERLANG_JIFFY_VERSION}"}/' $(@D)/src/jiffy.app.src

We use $(...) and not ${...} to refer to make variables. So I've fixed
this and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
