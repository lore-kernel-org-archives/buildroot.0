From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 12:04:00 +0200
Subject: [Buildroot] [PATCH v2] procps-ng: bump to version 3.3.14
In-Reply-To: <130c35b0d58841519c15a94b2730f675fa63192d.1523995096.git.baruch@tkos.co.il>
References: <130c35b0d58841519c15a94b2730f675fa63192d.1523995096.git.baruch@tkos.co.il>
Message-ID: <20180418120400.2845e55c@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Tue, 17 Apr 2018 22:58:16 +0300, Baruch Siach wrote:

> Note: procps now uses fopencookie(). musl libc added support for this
> extension in version 1.1.19. autobuilder musl toolchains currently use
> version 1.1.16.

I have started a new build of all the br-* pre-built toolchains with
the latest Git master. I'll wait for this to finish, deploy the
toolchains, and then apply this patch, if that's OK for you.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
