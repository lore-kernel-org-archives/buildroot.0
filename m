From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Jun 2017 15:35:42 +0200
Subject: [Buildroot] [PATCH 2/2] package lcdproc: override libpng-config
 path
In-Reply-To: <20170611152340.3e9f9298@windsurf.home>
References: <20170611131317.16345-1-romain.naour@gmail.com>
 <20170611131317.16345-2-romain.naour@gmail.com>
 <20170611152340.3e9f9298@windsurf.home>
Message-ID: <2a818f17-a975-07d2-4a81-72f0807748b6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 11/06/2017 ? 15:23, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sun, 11 Jun 2017 15:13:17 +0200, Romain Naour wrote:
>> Like for freetype-config, override libpng-config path otherwise
>> the one from the host system may be used when installed.
>> Make sure that the one from HOST_DIR is used.
> 
> You wanted to say STAGING_DIR here, right?

Humm yes, same for the patch 1/2...

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
