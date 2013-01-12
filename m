From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jan 2013 12:58:53 +0100
Subject: [Buildroot] [PATCH 2/2] arptables: bump to version 0.0.4
In-Reply-To: <1357990675-12863-2-git-send-email-gustavo@zacarias.com.ar>
References: <1357990675-12863-1-git-send-email-gustavo@zacarias.com.ar>
 <1357990675-12863-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130112125853.5cd7eba1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 12 Jan 2013 08:37:55 -0300, Gustavo Zacarias wrote:

> -ARPTABLES_VERSION = 0.0.3
> -ARPTABLES_VERSION_MINOR = 4
> -ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION)-$(ARPTABLES_VERSION_MINOR).tar.gz
> +ARPTABLES_VERSION = 0.0.4
> +ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION).tar.gz
>  ARPTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/arptables/arptables-v$(ARPTABLES_VERSION)

Could you add LICENSE and LICENSE_FILES while you're at it? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
