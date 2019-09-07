From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 23:21:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/json-for-modern-cpp: fixup the
 'v' prefix in the version
In-Reply-To: <20190907201721.28772-1-fontaine.fabrice@gmail.com>
References: <20190907201721.28772-1-fontaine.fabrice@gmail.com>
Message-ID: <20190907232157.6380c061@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Sep 2019 22:17:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> In order for the json-for-modern-cpp version to match what is given by
> release-monitoring.org, the 'v' prefix should be encoded in
> JSON_FOR_MODERN_CPP_SITE and not JSON_FOR_MODERN_CPP_VERSION.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
>  package/json-for-modern-cpp/json-for-modern-cpp.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
