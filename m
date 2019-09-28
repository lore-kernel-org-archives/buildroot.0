From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 22:39:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/easy-rsa: bump to version 3.0.6
In-Reply-To: <20190928065758.26007-1-fontaine.fabrice@gmail.com>
References: <20190928065758.26007-1-fontaine.fabrice@gmail.com>
Message-ID: <20190928223955.6fa5aa3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 08:57:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add hash for license files
> - COPYING renamed in COPYING.md by
>   https://github.com/OpenVPN/easy-rsa/commit/b75faa475f22af55202d4b2be429cd30f16f15ac
> - openssl-1.0.cnf renamed in openssl-easyrsa.cnf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/easy-rsa/easy-rsa.hash |  6 +++++-
>  package/easy-rsa/easy-rsa.mk   | 10 +++++-----
>  2 files changed, 10 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
