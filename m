From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jun 2017 18:57:40 +0200
Subject: [Buildroot] [PATCH] package/openpowerlink: bump to 2.6.0
In-Reply-To: <20170603151935.6012-1-romain.naour@gmail.com>
References: <20170603151935.6012-1-romain.naour@gmail.com>
Message-ID: <20170603185740.15371ef2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Jun 2017 17:19:35 +0200, Romain Naour wrote:
> See https://sourceforge.net/p/openpowerlink/news/2017/05/openpowerlink-v260
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...all-the-stack-libraries-to-lib-subdirectory.patch | 16 ++++++++--------
>  .../0002-cmake-install-oplk-headers-files.patch      |  8 ++++----
>  .../0003-Add-top-level-CMakeLists.txt.patch          |  8 ++++----
>  ...=> 0004-use-contrib-getopt-only-on-Windows.patch} | 20 ++++++++++----------  
>  ...-config-to-fix-static-linking-with-libpcap.patch} |  8 ++++----
>  package/openpowerlink/openpowerlink.hash             |  8 ++++----
>  package/openpowerlink/openpowerlink.mk               |  2 +-
>  7 files changed, 35 insertions(+), 35 deletions(-)
>  rename package/openpowerlink/{0004-FIX-use-contrib-getopt-only-on-Windows.patch => 0004-use-contrib-getopt-only-on-Windows.patch} (89%)
>  rename package/openpowerlink/{0005-FIX-use-pcap-config-to-fix-static-linking-with-libpc.patch => 0005-use-pcap-config-to-fix-static-linking-with-libpcap.patch} (96%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
