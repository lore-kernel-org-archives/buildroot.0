From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:54:30 +0100
Subject: [Buildroot] [PATCH 1/1] package: indentation cleanup
In-Reply-To: <1418138071-9219-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1418138071-9219-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20141210215430.27e7d003@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Tue,  9 Dec 2014 16:14:31 +0100, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  fs/common.mk               |    2 +-
>  package/omniorb/omniorb.mk |    2 +-

I've applied this part.

>  package/xenomai/xenomai.mk |    6 +++---

But not this one, because I'm not sure we have a strict rule about
this, and how consistent we are in other <pkg>_USERS, <pkg>_DEVICES and
<pkg>_PERMISSIONS uses.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
