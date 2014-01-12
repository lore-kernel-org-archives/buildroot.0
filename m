From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 12 Jan 2014 19:40:08 +0100
Subject: [Buildroot] [PATCH 04/14] libbluray: new package
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389549208-19078-5-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <854bqaxocd.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote in
news:1389549208-19078-5-git-send-email-maxime.hadjinlian at gmail.com: 

> +LIBBLURAY_VERSION = 0.2.2

Hi,

current version is 0.5.0.

My local package also included these depends, maybe you also need them:

LIBBLURAY_DEPENDENCIES = host-pkgconf freetype bzip2 libxml2 zlib $(if $(BR2
_PACKAGE_LIBICONV),libiconv)

Regards, Bernd
