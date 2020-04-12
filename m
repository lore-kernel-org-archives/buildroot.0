From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 21:44:40 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python-argon2-cffi: new
 package
In-Reply-To: <20200213074245.61969-1-james.hilliard1@gmail.com>
References: <20200213074245.61969-1-james.hilliard1@gmail.com>
Message-ID: <20200412214440.7b4b4a25@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Feb 2020 00:42:45 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> The secure Argon2 password hashing algorithm.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - add missing host-python-cffi dependency
> ---
>  DEVELOPERS                                        |  1 +
>  package/Config.in                                 |  1 +
>  package/python-argon2-cffi/Config.in              |  9 +++++++++
>  .../python-argon2-cffi/python-argon2-cffi.hash    |  5 +++++
>  package/python-argon2-cffi/python-argon2-cffi.mk  | 15 +++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/python-argon2-cffi/Config.in
>  create mode 100644 package/python-argon2-cffi/python-argon2-cffi.hash
>  create mode 100644 package/python-argon2-cffi/python-argon2-cffi.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
