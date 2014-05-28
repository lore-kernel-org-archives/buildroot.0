From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 May 2014 09:51:41 +0200
Subject: [Buildroot] [PATCH v2] dropbear: fix missing directory with
 systemd
In-Reply-To: <1401263180-30574-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1401263180-30574-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140528095141.61421fce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Wed, 28 May 2014 09:46:20 +0200, Maxime Hadjinlian wrote:

> +	mkdir -p ${TARGET_DIR}/etc/dropbear

	$(TARGET_DIR)

i.e, with parenthesis and not curly braces.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
