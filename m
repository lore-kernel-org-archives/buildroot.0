From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Feb 2017 08:01:14 +0100
Subject: [Buildroot] [PATCH] poco: build it as "poco", not "poco-poco"
References: <1486771153-10386-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <qep2ndxk89.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

Am Fri, 10 Feb 2017 21:59:13 -0200 schrieb Carlos Santos:

> +POCO_VERSION = 1.7.2
> +POCO_VERSION_TAG = poco-1.7.2-release

what about

POCO_VERSION_TAG = poco-$(POCO_VERSION)-release

Regards, Bernd
