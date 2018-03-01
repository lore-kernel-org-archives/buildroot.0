From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 16:52:32 +0100
Subject: [Buildroot] [PATCH v2 4/9] docker-engine: select static for
 tini and dumb-init
In-Reply-To: <20180301095956.11e3be8e@windsurf.lan> (Thomas Petazzoni's
 message of "Thu, 1 Mar 2018 09:59:56 +0100")
References: <20180301072012.25884-1-christian@paral.in>
 <20180301072012.25884-5-christian@paral.in>
 <20180301095956.11e3be8e@windsurf.lan>
Message-ID: <87efl3iyin.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> +	select BR2_PACKAGE_DUMB_INIT_STATIC
 >> help
 >> Use dumb-init as the container init process.

 > Unless I'm missing something, this patch is selecting options that
 > don't exist anymore.

yes, it looks like it can be dropped.

-- 
Bye, Peter Korsgaard
