From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 22:00:04 +0100
Subject: [Buildroot] [PATCH/next 2/3] python-lockfile: new package
In-Reply-To: <20191125193850.862709-2-aduskett@gmail.com>
References: <20191125193850.862709-1-aduskett@gmail.com>
 <20191125193850.862709-2-aduskett@gmail.com>
Message-ID: <20191225220004.0a9451f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Nov 2019 11:38:49 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <aduskett@greenlots.com>
> 
> The lockfile package exports a LockFile class which provides a
> simple API for locking files. Unlike the Windows
> msvcrt.locking function, the fcntl.lockf and flock functions,
> and the deprecated posixfile module, the API is identical
> across both Unix (including Linux and Mac) and Windows
> platforms.
> 
> The lock mechanism relies on the atomic nature of the link
> (on Unix) and mkdir (on Windows) system calls. An
> implementation based on SQLite is also provided, more as a
> demonstration of the possibilities it provides than as
> production-quality code.
> 
> Signed-off-by: Adam Duskett <aduskett@greenlots.com>
> ---
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-lockfile/Config.in            | 17 +++++++++++++++++
>  package/python-lockfile/python-lockfile.hash |  5 +++++
>  package/python-lockfile/python-lockfile.mk   | 15 +++++++++++++++
>  5 files changed, 39 insertions(+)
>  create mode 100644 package/python-lockfile/Config.in
>  create mode 100644 package/python-lockfile/python-lockfile.hash
>  create mode 100644 package/python-lockfile/python-lockfile.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
