From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:20:31 +0200
Subject: [Buildroot] [PATCH 1/1] yaml-cpp: bump to version 0.6.2
In-Reply-To: <20180609104637.27092-1-fontaine.fabrice@gmail.com>
References: <20180609104637.27092-1-fontaine.fabrice@gmail.com>
Message-ID: <20180610142031.7ec979af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Jun 2018 12:46:37 +0200, Fabrice Fontaine wrote:
> - Remove boost dependency (not needed since 0.6)
> - Add C++11 dependency (needed since 0.6)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/yaml-cpp/Config.in     | 8 +++-----
>  package/yaml-cpp/yaml-cpp.hash | 3 ++-
>  package/yaml-cpp/yaml-cpp.mk   | 8 +++-----
>  3 files changed, 8 insertions(+), 11 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
