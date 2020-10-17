From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Oct 2020 14:57:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: use system
 libargon2
In-Reply-To: <20200515213120.1174774-1-james.hilliard1@gmail.com>
References: <20200515213120.1174774-1-james.hilliard1@gmail.com>
Message-ID: <20201017145748.413f3919@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 May 2020 15:31:20 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The python-argon2-cffi package can be used with the system libargon2,
> we should use that instead of the embedded version.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-argon2-cffi/Config.in             | 3 +++
>  package/python-argon2-cffi/python-argon2-cffi.mk | 7 ++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
