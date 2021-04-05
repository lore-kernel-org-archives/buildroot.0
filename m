From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Apr 2021 21:19:33 +0200
Subject: [Buildroot] [PATCH] boot/at91bootstrap: add legal information
In-Reply-To: <877dlgr1me.fsf@dell.be.48ers.dk>
References: <20210405153249.1352356-1-thomas.petazzoni@bootlin.com>
 <87blasr8ko.fsf@dell.be.48ers.dk>
 <20210405204307.7ebb5d7c@windsurf.home>
 <877dlgr1me.fsf@dell.be.48ers.dk>
Message-ID: <20210405211933.65a98d96@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 05 Apr 2021 21:07:53 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> "Never" is probably a bit too strong. I know I have done it in the past,
> and there's even a bootlin blog entry about doing it ;)
> 
> https://bootlin.com/blog/at91bootstrap-linux/

Fair enough :-)

Then we could use include/sdramc.h, which is even smaller, and less
likely to be changed. Let me know if that makes sense, or if you're
fine with keeping main.c.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
