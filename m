From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2009 21:52:28 +0200
Subject: [Buildroot] unrecognised command line option Error
In-Reply-To: <428184.39297.qm@web59313.mail.re1.yahoo.com>
References: <428184.39297.qm@web59313.mail.re1.yahoo.com>
Message-ID: <20090819215228.278c7ef5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First, please do *NOT* send several times the same e-mail with the same
question. You posted four times the same question, this is very
annoying. These multiple posts is a strong incentive to not answer your
question. So please avoid that in the future, thanks.

Le Wed, 19 Aug 2009 06:24:24 -0700 (PDT),
suhas dumbhare <s_dumbhare@yahoo.com> a ?crit :

>  command line option "-mfdpic"

-mfdpic is a gcc option specific to the FRV architecture. So it's
strange that uClibc uses it if you configured Buildroot for ARM.

Could you post Buildroot configuration file. It is named .config in the
main Buildroot directory.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
