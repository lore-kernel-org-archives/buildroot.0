From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 18 Jan 2014 19:55:25 +0100
Subject: [Buildroot] [PATCH v2 06/12] librtmp: new package
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389831355-19983-7-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <t9vqqaxocp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote in
news:1389831355-19983-7-git-send-email-maxime.hadjinlian at gmail.com: 

> rtmpdump - RTMPDump Real-Time Messaging Protocol API

Hi,

please add

$(if $(BR2_PACKAGE_LIBRTMP),librtmp) \

to LIBCURL_DEPENDENCIES in package/libcurl/libcurl.mk

Regards, Bernd
