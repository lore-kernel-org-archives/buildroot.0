From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:37:49 +0100
Subject: [Buildroot] [PATCH v5] gtest/gmock: bump to version 1.8.0
In-Reply-To: <c410065bcf02dbf9548965118905fb4e0edfcc40.1486901824.git.casantos@datacom.ind.br>
References: <1473290219-27701-1-git-send-email-casantos@datacom.ind.br>
 <c410065bcf02dbf9548965118905fb4e0edfcc40.1486901824.git.casantos@datacom.ind.br>
Message-ID: <20170212153749.7f9aff72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 10:17:27 -0200, Carlos Santos wrote:

> +define HOST_GTEST_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
> +		$(HOST_DIR)/usr/bin/gmock_gen.py
> +	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen

Is there a good reason to not install directly gmock_gen.py as
gmock_gen ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
