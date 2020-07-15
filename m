From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:50:48 +0200
Subject: [Buildroot] [PATCH 1/4] package/mender-artifact: bump version
 to 3.4.0
In-Reply-To: <20200715173707.584226-1-aduskett@gmail.com>
References: <20200715173707.584226-1-aduskett@gmail.com>
Message-ID: <20200715235048.57b18dfe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 10:37:04 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Update the following license file hashes due to copyright year changes:
>   - vendor/github.com/mendersoftware/mendertesting/LICENSE
>   - vendor/github.com/davecgh/go-spew/LICENSE
>   - vendor/github.com/stretchr/testify/LICENSE
> 
> Add hashes for the the following new files:
>   - vendor/github.com/minio/sha256-simd/LICENSE
>   - vendor/gopkg.in/yaml.v2/LICENSE
>   - vendor/github.com/klauspost/compress/LICENSE
>   - vendor/github.com/russross/blackfriday/v2/LICENSE.txt
>   - vendor/github.com/klauspost/pgzip/LICENSE
>   - vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md
>   - vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/mender-artifact/mender-artifact.hash | 17 ++++++++++++-----
>  package/mender-artifact/mender-artifact.mk   | 11 +++++++++--
>  2 files changed, 21 insertions(+), 7 deletions(-)

I've applied the entire series to master. I did some minor formatting
tweaks on the last patch, nothing crazy. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
