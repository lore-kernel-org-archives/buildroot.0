From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Mar 2017 13:32:20 +0100
Subject: [Buildroot] [PATCH] fakeroot: bump version to 1.21-2
In-Reply-To: <d5b7097f-1af5-1130-21b2-fb3c1278a646@andin.de>
References: <20161004115320.647-1-maxime.hadjinlian@gmail.com>
 <20161004163555.7c8af28f@free-electrons.com>
 <CAGduivwqAtheOrr_J0XWXR-9rjWNwPC9Y0dFCqKyBua+bir0ww@mail.gmail.com>
 <d5b7097f-1af5-1130-21b2-fb3c1278a646@andin.de>
Message-ID: <20170313133220.62892a21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Mar 2017 11:43:49 +0100, Andreas Naumann wrote:

> I have another reason to bump to 1.21, but experience the same 
> difficulties in getting the configure step right. What would be a 
> sensible way to avoid depending on autoconf/automake?

Is your reason to depend on automake/autoconf still the same as what it
was in Maxime's patch? If so, then we can patch Makefile.in instead of
Makefile.am. We normally don't like that very much, but I personally
prefer this solution over having fakeroot depending on
automake/autoconf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
