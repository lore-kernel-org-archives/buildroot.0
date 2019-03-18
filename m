From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 21:57:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: correct license file
 hash
In-Reply-To: <20190317204800.17703-1-martin@barkynet.com>
References: <20190317204800.17703-1-martin@barkynet.com>
Message-ID: <20190318215758.08ae858b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 20:47:59 +0000
Martin Bark <martin@barkynet.com> wrote:

> The LICENSE file in nodejs 10.15.3 updated to include additional
> 3rd party licenses.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/4bf66b9f05e9d04171156e44c7dd87619e429747
>  - http://autobuild.buildroot.net/results/a65776ba1045f12263a686933eb6a4b5d6ff7333
>  - http://autobuild.buildroot.net/results/aab619106a7d763f45e95a7ae3d85816fb4a6512
>  - http://autobuild.buildroot.net/results/bb6cb93f323be22e4c0efc05011042526c01f62c
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/nodejs/nodejs.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
