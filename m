From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:11:53 +0100
Subject: [Buildroot] [PATCH 1/1] domoticz: depends on exception_ptr
In-Reply-To: <20180117175500.19177-1-fontaine.fabrice@gmail.com>
References: <20180117175500.19177-1-fontaine.fabrice@gmail.com>
Message-ID: <20180117221153.724bd8ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Jan 2018 18:55:00 +0100, Fabrice Fontaine wrote:
> boost 1.66 uses std::exception_ptr in boost/asio/impl/use_future.hpp
> So add a dependency on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 for domoticz
> 
> Fixes:
>  -
> http://autobuild.buildroot.net/results/332f677493bf1d802f3700777219843eeba53c81
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/domoticz/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
