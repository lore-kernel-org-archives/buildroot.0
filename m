From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:54:50 +0100
Subject: [Buildroot] [PATCH v6 12/16] erlang-p1-stringprep: new package.
In-Reply-To: <1421055140-5092-13-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
 <1421055140-5092-13-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150203105450.03d79570@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 12 Jan 2015 10:32:16 +0100, Johan Oudinet wrote:

> +ERLANG_P1_STRINGPREP_VERSION = 9e9e0f8
> +ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
> +ERLANG_P1_STRINGPREP_LICENSE = GPLv2+

License was not GPLv2+, but TCL. Applied with this fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
