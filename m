From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Fri, 03 Feb 2017 11:44:37 +0100
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH_1/2=5D_Add_BR2=5FCMAKE=5FUSE=5FNIN?=
 =?utf-8?q?JA=5FBACKEND_option?=
In-Reply-To: <20170201211232.2f4effde@free-electrons.com>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
 <ef982565-16ec-591b-aaed-d22e5a634851@gmail.com>
 <2260e784237284271ff7745986b82cc8@openmailbox.org>
 <e48cfb34-6f4c-1c7b-c737-c5a57eb464e0@gmail.com>
 <20170125142716.55e7d7b3@free-electrons.com>
 <901720b443e9bb90750a71c8797bbf0d@openmailbox.org>
 <20170130102316.2a02ed3a@free-electrons.com>
 <1422fd7b4aadc4c1efbec44cf687740c@openmailbox.org>
 <20170201211232.2f4effde@free-electrons.com>
Message-ID: <059fe06e34e46aed269bf4210c143516@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2017-02-01 21:12, Thomas Petazzoni a ?crit?:
> In the first case you're using the shell built-in "time" program, in
> the later you're using the separate /usr/bin/time program. Try:

Thank you, I was not aware of that.

> I'm indeed not sure it's really worth the effort for such a small
> saving.

OK, so let's forget it. Moreover, as you have mentioned in your reply to 
the second patch (on documentation), there are some problems with 
$(2)_INSTALL_STAGING/TARGET_OPTS being changed to 
$(2)_INSTALL_STAGING/TARGET_ENV, and also with parallel build support 
being not supported for some packages.

Regards.

-- 
C?dric
