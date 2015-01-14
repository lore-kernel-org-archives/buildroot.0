From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:31:33 +0100
Subject: [Buildroot] [PATCH 7/7] rsyslog: enable more basic features
In-Reply-To: <1421191022-5509-7-git-send-email-gustavo@zacarias.com.ar>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
 <1421191022-5509-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150114203133.039c18be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 13 Jan 2015 20:17:02 -0300, Gustavo Zacarias wrote:

> +RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
> +		$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))

Only one tab on the second line. I fixed that when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
