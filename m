From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:17:30 +0100
Subject: [Buildroot] [PATCH 1/2] package/mender: bump to version 2.1.1
In-Reply-To: <20191028173750.45261-1-aduskett@gmail.com>
References: <20191028173750.45261-1-aduskett@gmail.com>
Message-ID: <f402d3a7-cdfe-6f29-902d-b00e35fbd8b4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 18:37, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Also change License sha256sums.
> Removed:
>   - vendor/github.com/mendersoftware/log/COPYING
>   - vendor/github.com/mendersoftware/scopestack/COPYING
> 
> Added:
>   - vendor/golang.org/x/crypto/LICENSE
>   - vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE
> 
> moved:
>   - vendor/github.com/mendersoftware/go-liblzma/LICENSE to
>     vendor/github.com/remyoudompheng/go-liblzma/LICENSE
> 
>   - vendor/github.com/Sirupsen/logrus/LICENSE to
>     vendor/github.com/sirupsen/logrus/LICENSE
> 
> Updated:
>   - vendor/github.com/mendersoftware/log/LICENSE: Changed from copyright mender
>     software to Apache 2.0
> 
>   - vendor/github.com/mendersoftware/scopestack/LICENSE: Changed from copyright
>     mender to Apache 2.0.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

 Both applied to master, thanks.

 Thank you for the concise but still very clear explanation of the license file
changes!

 Regards,
 Arnout
