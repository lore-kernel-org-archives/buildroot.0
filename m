From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 18:59:10 +0200
Subject: [Buildroot] [PATCH v2] package/boost: add boot-type_erasure
 support
In-Reply-To: <1467473392-16516-1-git-send-email-romain.naour@gmail.com>
References: <1467473392-16516-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160702185910.1b67095f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 17:29:52 +0200, Romain Naour wrote:
> From: Romain Naour <romain.naour@smile.fr>
> 
> Until now this library wasn't handled by the Buildroot packaging,
> so add a new config option to disable it when requested.
> 
> Also disable boost-type_erasure for the host variant to keep it as
> minimal as possible.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> v2: remove the dependency on toolchain w/ NTPL threads support (Bernd)
> ---
>  package/boost/Config.in | 3 +++
>  package/boost/boost.mk  | 4 +++-
>  2 files changed, 6 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
