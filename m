From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Mar 2017 19:40:51 +0100
Subject: [Buildroot] [PATCH 2/3] package/x11r7/xserver_xorg-server: bump
 to	version 1.19.3
References: <20170319205155.3333-1-romain.naour@gmail.com>
 <20170319205155.3333-2-romain.naour@gmail.com>
Message-ID: <jak5qdxdon.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 19 Mar 2017 21:51:54 +0100 schrieb Romain Naour:

> -# From https://lists.x.org/archives/xorg-announce/2017-March/002779.html
> -sha256 4f8ab9f4a1a885fe7550080555381b34b82858582559e8e3c4da96e3a85884bb        xorg-server-1.19.2.tar.bz2
> +# From https://lists.freedesktop.org/archives/xorg/2017-March/058662.html
> +sha256 8f93b98f1ac9fbd87515bfe329a069b48bbec98e5329584ab5fbf759a0953b8d        xorg-server-1.19.3.tar.bz2

Hi,

the new hash is wrong:

ERROR: xorg-server-1.19.3.tar.bz2 has wrong sha256 hash:
ERROR: expected: 8f93b98f1ac9fbd87515bfe329a069b48bbec98e5329584ab5fbf759a0953b8d
ERROR: got     : 677a8166e03474719238dfe396ce673c4234735464d6dadf2959b600d20e5a98
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

You used the hash for the gz file.

Regards, Bernd
