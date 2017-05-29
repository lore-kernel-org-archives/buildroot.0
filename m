From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 22:36:21 +0200
Subject: [Buildroot] [PATCH] swupdate: bump to version 2017.04
In-Reply-To: <20170529101735.24229-1-joerg.krause@embedded.rocks>
References: <20170529101735.24229-1-joerg.krause@embedded.rocks>
Message-ID: <20170529223621.2c6b7678@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 12:17:35 +0200, J?rg Krause wrote:
> Add optional dependency on zeromq which was already added in version
> 2016.10.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/swupdate/Config.in     | 2 ++
>  package/swupdate/swupdate.hash | 2 +-
>  package/swupdate/swupdate.mk   | 9 ++++++++-
>  3 files changed, 11 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
