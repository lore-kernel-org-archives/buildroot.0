From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:43:51 +0200
Subject: [Buildroot] [PATCH v3] qt5webkit-examples: new package
In-Reply-To: <1405079212-25934-1-git-send-email-fatih.asici@gmail.com>
References: <1405079212-25934-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <20140715224351.5875a6c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Fri, 11 Jul 2014 14:46:52 +0300, Fatih A??c? wrote:
> From: Massimo Callegari <massimocallegari@yahoo.it>
> 
> Signed-off-by: Massimo Callegari <massimocallegari@yahoo.it>
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>

I've applied your patch, with one change:


> +QT5WEBKIT_EXAMPLES_INSTALL_STAGING = YES

This is not needed, since you're only installing examples to the target
anyway.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
