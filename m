From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2011 17:20:39 +0100
Subject: [Buildroot] [PATCH v2 1/2] Makefile: improve $(TARGET_DIR)
 (re)creation
In-Reply-To: <AANLkTimmDuHy5+u63ayUan1q1-LXKDM335qd22gngxbv@mail.gmail.com>
References: <1297986294-23446-1-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTinSvBJ79mKnsGND7BL+FVfPQN-cp1jRuEmCZpy1@mail.gmail.com>
	<AANLkTimmDuHy5+u63ayUan1q1-LXKDM335qd22gngxbv@mail.gmail.com>
Message-ID: <20110301172039.1d30ff29@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 1 Mar 2011 17:03:22 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> Ping ping :-)
> 
> Now that the new cycle has opened, any comments on this?
> 
> I'd really like to get this functionality in mainline :-)

I think the functionality is great, but I'd prefer to see it integrated
on top of the packaging work started by Lionel rather than coded as
proposed in the current patch. I am also not sure that rebuilding the
$(TARGET_DIR) without rebuilding the $(STAGING_DIR) is a good thing.

However, it's true that the packaging work started by Lionel is not
ready for inclusion yet, so maybe we should merge this as is, and then
update it once we have the proper packaging mechanism working.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
