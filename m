From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 22:19:55 +0100
Subject: [Buildroot] [PATCH 1/2] help: add a way to document targets
 declared in local.mk/external.mk
In-Reply-To: <20160308220221.0a5088d0@free-electrons.com>
References: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
 <56DF3C1F.30205@mind.be>
 <20160308220221.0a5088d0@free-electrons.com>
Message-ID: <20160308221955.4567b005@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Mar 2016 22:02:21 +0100, Thomas Petazzoni wrote:

> >   Looks good to me, except that I don't like the name 'LOCAL'. I'd prefer e.g. 
> > ADDITIONAL.
> 
> Wouldn't EXTERNAL_HELP be even better, suggesting that its main
> use-case is for BR2_EXTERNAL ?

My suggestion obviously doesn't work if we want to use this for
internal packages, as PATCH 2/2 is doing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
