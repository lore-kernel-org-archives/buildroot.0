From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2011 08:48:48 +0100
Subject: [Buildroot] [PATCH 1/1] New package : libesmtp Library for
 sending email through SMTP.
In-Reply-To: <1323822411-12938-1-git-send-email-sagaert.johan@skynet.be>
References: <1323822411-12938-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20111214084848.6d49b578@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 14 Dec 2011 01:26:51 +0100,
Sagaert Johan <sagaert.johan@skynet.be> a ?crit :

> This is a library that could be used to send emails through SMTP.

Looks good, but are you sure the OpenSSL support is mandatory? Can't
libesmtp be compiled without SSL support? If so, it'd be great to make
it optional.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
