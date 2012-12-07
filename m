From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 6 Dec 2012 21:14:47 -0500
Subject: [Buildroot] [PATCH] fix cjson package
In-Reply-To: <50C0B73C.9020407@syscom-instruments.com>
References: <50C0B73C.9020407@syscom-instruments.com>
Message-ID: <CANxTyt4OZM0u3jyGrDoAQPvBSzVQ_=BHz_c0rNW6Y9pSr1jzbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Viallard,

> -CJSON_VERSION         = undefined
> -CJSON_SOURCE          = cJSONFiles.zip
> +CJSON_VERSION         = 2011-10-10
> +CJSON_SOURCE          = cJSONFiles-$(CJSON_VERSION).zip
>  CJSON_SITE            = http://downloads.sourceforge.net/project/cjson/

This worked for you?  It doesn't work for me ... i.e. this line works for me:

    wget http://downloads.sourceforge.net/project/cjson/cJSONFiles.zip

but this line gives me ERROR 404 Not Found:

    wget http://downloads.sourceforge.net/project/cjson/cJSONFiles-2011-10-10.zip

Am I missing something here?

Danomi -
