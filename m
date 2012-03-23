From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Mar 2012 10:20:58 +0100
Subject: [Buildroot] ofono package
In-Reply-To: <20120323101100.5fa94c86@skate>
References: <CAAfyv35Rq_ad_obvHC2QZdhBvebLqpsRO7G0B4qpkGZuEYamuA@mail.gmail.com>
 <CAGm1_ks7QkKyFS7wWPMi3ytu4d2QU=k=gVEcnq6ENoA-CM3sKQ@mail.gmail.com>
 <20120323101100.5fa94c86@skate>
Message-ID: <20120323102058.3a159cc4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 23 Mar 2012 10:11:00 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> If this bootstrap stuff is used to regenerate the configure script and
> Makefile.am, then use OFONO_AUTORECONF=YES.

Looking at the package source code, setting OFONO_AUTORECONF=YES should
be sufficient. Just remove your OFONO_CONFIGURE_CMDS and see if it
works.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
