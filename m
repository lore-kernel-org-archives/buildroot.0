From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2011 23:48:14 +0100
Subject: [Buildroot] Adding stunnel
In-Reply-To: <AANLkTik+ge-q7jLcw3-caf6FOy8PjJ8zzesGj5GXgm-n@mail.gmail.com>
References: <AANLkTiknO=A98cXWgg2DHa73uFbYwBtXmUF_7N8fbtx9@mail.gmail.com>
	<351790.51583.qm@web29602.mail.ird.yahoo.com>
	<AANLkTik+ge-q7jLcw3-caf6FOy8PjJ8zzesGj5GXgm-n@mail.gmail.com>
Message-ID: <20110315234814.04bd9770@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Mar 2011 10:38:00 +0000
bruce bushby <bruce.bushby@gmail.com> wrote:

> For now I think I got it compiled and installed by adding additional
> paths to my configure options:
> STUNNEL_CONF_OPT = \
>         --with-shared \
>         --with-ssl=$(STAGING_DIR)/usr \
>         --with-libssl-prefix=$(STAGING_DIR)/usr \
>         --without-debug
> 
> Although I'm sure it's not the "buildroot way"...I'll have to read a
> bit more on adding packages....I've been lazy in this area.

I haven't looked at stunnel precisely, but the paths you're passing are
correct.

The best would be to post a proper patch that adds stunnel so that we
can review/comment the whole thing, and integrate it into Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
