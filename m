From: Andrea Cappelli <a.cappelli@gmail.com>
Date: Wed, 30 Dec 2015 09:53:57 +0100
Subject: [Buildroot] [PATCH] Added uwsgi to packages
In-Reply-To: <20151229204213.69aae4fc@free-electrons.com>
References: <CAKR0bvtdwebq-VkZ9+pcVb2KwHZvJ_AVb4sydQYvjgPndQRTJQ@mail.gmail.com>
 <20151229183218.23fac6c1@free-electrons.com>
 <CAKR0bvuMyYv62qcYExnPrX9Vjtkx8D+gLmrSodRMDkXvn4-uWg@mail.gmail.com>
 <20151229204213.69aae4fc@free-electrons.com>
Message-ID: <CAKR0bvuP2W6gNjNAWECvky6=Dfj4k0WK4wppyxwCxvcJH_TZ3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-12-29 20:42 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Andrea,
>
> [...]
> I don't really like the fact that it's a python-package if really it
> isn't one. Can you try making it a generic-package, with
> <pkg>_BUILD_CMDS calling $(MAKE) -C $(@D), and adding host-python to
> the <pkg>_DEPENDENCIES variable ?
>

Hi Thomas,
as soon as I have some spare time I'll rework the patch as you suggested,
try in on my dev board and send back

Thank you for your review


-- 
Andrea Cappelli
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151230/49b30ddf/attachment.html>
