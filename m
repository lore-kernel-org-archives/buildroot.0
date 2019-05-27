From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 May 2019 11:37:54 +0200
Subject: [Buildroot] [PATCH v2 1/7] package/sqlite: fix BUG_85180 build
 timeout
In-Reply-To: <3e1c735b-0639-ffaf-9d96-7b51920668fc@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-2-giulio.benetti@micronovasrl.com>
 <20190524222459.2fc91773@windsurf.home>
 <6dcdb1eb-5d48-e773-9711-1df461c542e2@micronovasrl.com>
 <3e1c735b-0639-ffaf-9d96-7b51920668fc@micronovasrl.com>
Message-ID: <20190527113754.48973b30@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 May 2019 11:06:06 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> >> I cannot reproduce this timeout, and you don't have any autobuilder
> >> failure. Could you provide a configuration that exhibits the failure ?  
> 
> Sure, the problems comes out building libnss with gcc4.9/5/6/7.
> Here is pastebin of my savedefconfig:
> https://pastebin.com/wmR8Dme3

I still don't understand. You're mentioning libnss, but your defconfig
does not have libnss enabled. Am I missing something ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
