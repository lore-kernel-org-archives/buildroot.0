From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 22:26:39 +0100
Subject: [Buildroot] [PATCH 2/3] axel: Fix OpenSSL dependency
In-Reply-To: <20171205054237.2150-2-ismael@iodev.co.uk>
References: <20171205054237.2150-1-ismael@iodev.co.uk>
 <20171205054237.2150-2-ismael@iodev.co.uk>
Message-ID: <20171206222639.4b7dedf7@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Dec 2017 02:42:36 -0300, Ismael Luceno wrote:
> I got it wrong the first time, openssl is a virtual package.

Using 1st person sentences is not really the typical practice in commit
logs. So I've replaced this with:

    openssl is a virtual package, that can be provided by either libressl
    or libopenssl, so there's no need to check for libressl separately.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
