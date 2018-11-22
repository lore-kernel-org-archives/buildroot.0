From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Nov 2018 17:44:17 +0100
Subject: [Buildroot] [PATCH] package/systemd: needs glibc
In-Reply-To: <87y39lm6e8.fsf@dell.be.48ers.dk>
References: <20181121210556.18619-1-yann.morin.1998@free.fr>
 <87y39lm6e8.fsf@dell.be.48ers.dk>
Message-ID: <20181122174417.7e101a15@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Nov 2018 17:19:43 +0100, Peter Korsgaard wrote:

>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Waldemar Brodkorb <wbx@openadk.org>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  > Cc: Peter Korsgaard <peter@korsgaard.com>  
> 
> So this has been broken since end of June? How come we don't have any
> autobuilder failures?

Yes, this is really weird. Even with the issue fixed
https://git.buildroot.org/buildroot/commit/utils/genrandconfig?id=3eb49f59d6804c452e784759d9b3869215a8098f,
we should have had some systemd/uclibc configurations. I'll try to do
some research in the DB, but my SQL is rusty and gives requests that
are very slow to execute :/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
