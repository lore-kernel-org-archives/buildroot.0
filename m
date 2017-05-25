From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 25 May 2017 11:02:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/sngrep: fix static build with
	gnutls
References: <20170520162751.30809-1-romain.naour@gmail.com>
 <20170520162751.30809-2-romain.naour@gmail.com>
 <20170523162742.23372fb2@free-electrons.com>
 <9efd1b94-8830-15b9-8d17-608ce8eace50@gmail.com>
 <20170524084733.37fd3ca1@free-electrons.com>
 <d46413c8-2cf8-08cd-ce1e-f821896fa3bb@gmail.com>
Message-ID: <d6jivdxlhq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 24 May 2017 23:54:03 +0200 schrieb Romain Naour:

>> Yes, I believe we should add !BR2_STATIC_LIBS, of course propagated to
>> all reverse dependencies (but there are not too many of them).
> 
> Ok, I'll do it.

Hi,

patch done: http://patchwork.ozlabs.org/patch/766903/

Regards, Bernd
