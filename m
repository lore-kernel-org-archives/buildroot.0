From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 15:58:17 +0100
Subject: [Buildroot] [V2 1/1] ntp: security bump to verserion 4.2.8p9
In-Reply-To: <20170206141225.2311-1-aduskett@codeblue.com>
References: <20170206141225.2311-1-aduskett@codeblue.com>
Message-ID: <20170206155817.5e945678@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Feb 2017 09:12:25 -0500, Adam Duskett wrote:

> In addition, libssl_compat.h is now included in many files, which
> references openssl/evp.h, openssl/dsa.h, and openssl/rsa.h.
> Even if a you pass --disable-ssl as a configuration option, these
> files are now required.

Is this a bug in 4.2.8p9, or a real decision from upstream that OpenSSL
is now mandatory in ntp?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
