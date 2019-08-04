From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 04 Aug 2019 20:39:49 +0200
Subject: [Buildroot] [PATCH 2/2] package/collectd: security bump to
 version 5.9.0
References: <20190804150957.7844-1-bernd.kuhls@t-online.de>
 <20190804150957.7844-2-bernd.kuhls@t-online.de>
 <20190804171845.xvwkh7un7hyvk4fj@falbala.home.lespocky.de>
Message-ID: <lclj1gx1nl.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 04 Aug 2019 19:18:45 +0200 schrieb Alexander Dahl:

> 5.9.1 has been released few days ago:
> 
> https://github.com/collectd/collectd/releases

Hi,

https://collectd.org/files/ only has 5.9.0.

5.9.1 does not include any security patches, shall I wait for 5.9.1 to be 
released on collectd.org or should we switch to the github helper? In 
this case we need to autoreconf the package...

Regards, Bernd
