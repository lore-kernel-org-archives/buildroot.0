From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 22:25:04 +0200
Subject: [Buildroot] [PATCH 4/6] php: add PHP_VERSION_MAJOR variable
In-Reply-To: <1431978724-25081-4-git-send-email-bos@je-eigen-domein.nl>
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
 <1431978724-25081-4-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150518222504.35a1edad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Mon, 18 May 2015 21:52:02 +0200, Floris Bos wrote:
> Add PHP_VERSION_MAJOR variable to php.mk for use by other packages.
> E.g. to install the Ioncube loader binary, it is necessary to
> know the PHP major version.

Are such packages going to be submitted to Buildroot at some point?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
