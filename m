From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 04 Dec 2017 18:49:55 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: bump to version 20.0
References: <20171130154202.437-1-johan.oudinet@gmail.com>
 <20171203105905.3bdd1dc9@windsurf.lan>
Message-ID: <3fegfexqs4.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 03 Dec 2017 10:59:05 +0100 schrieb Thomas Petazzoni:

> Seems like host-zlib is needed.

Hi,

host-erlang depends on host-openssl which depends on host-zlib so this 
should not be the problem. Anyway I could reproduce the build error on a 
minimal Debian system which lacks a zlib-dev package, host-zlib was built 
by buildroot.

More investigation is needed on my part, but for today I have no time 
left for this, sorry.

Regards, Bernd
