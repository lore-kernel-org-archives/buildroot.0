From: Christian Stewart <christian@paral.in>
Date: Thu, 01 Mar 2018 12:59:45 -0500
Subject: [Buildroot] [PATCH v2 4/9] docker-engine: select static for
 tini and dumb-init
In-Reply-To: <20180301095956.11e3be8e@windsurf.lan>
References: <20180301072012.25884-1-christian@paral.in>
 <20180301072012.25884-5-christian@paral.in>
 <20180301095956.11e3be8e@windsurf.lan>
Message-ID: <87y3jbptgu.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>> In many cases docker-init backing processes like Tini and dumb-init must
>> be static, as they are executed inside a container in an unknown
>> environment. This patch selects the static compilation options on both
>> packages when used as docker-init backing processes.

> Unless I'm missing something, this patch is selecting options that
> don't exist anymore.

Yes, this can be dropped.

Best,
Christian 
