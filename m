From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:21:40 +0100
Subject: [Buildroot] [PATCH 2/3] package/x11r7/xserver_xorg-server: bump
 to	version 1.19.3
In-Reply-To: <jak5qdxdon.ln2@ID-313208.user.individual.net>
References: <20170319205155.3333-1-romain.naour@gmail.com>
 <20170319205155.3333-2-romain.naour@gmail.com>
 <jak5qdxdon.ln2@ID-313208.user.individual.net>
Message-ID: <20170320222140.7526eb03@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 19:40:51 +0100, Bernd Kuhls wrote:

> ERROR: xorg-server-1.19.3.tar.bz2 has wrong sha256 hash:
> ERROR: expected: 8f93b98f1ac9fbd87515bfe329a069b48bbec98e5329584ab5fbf759a0953b8d
> ERROR: got     : 677a8166e03474719238dfe396ce673c4234735464d6dadf2959b600d20e5a98
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Romain fixed it in the third patch, touching the ATI driver, but
indeed, it's a bit messed up. I fixed this when applying. Thanks for
noticing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
