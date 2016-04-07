From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Thu, 7 Apr 2016 11:19:05 +0200
Subject: [Buildroot] [PATCH 4/4 v2] core/pkg-infra: download git
 submodules if the package wants them
In-Reply-To: <8373904cdf1fee9724d6834b56efaa706a92fc31.1459541702.git.yann.morin.1998@free.fr>
References: <cover.1459541702.git.yann.morin.1998@free.fr>
 <8373904cdf1fee9724d6834b56efaa706a92fc31.1459541702.git.yann.morin.1998@free.fr>
Message-ID: <57062609.60404@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/04/2016 22:25, Yann E. MORIN wrote:
> Add a new package variable that packages can set to specify that they
> need git submodules.
> 
> Only accept this option if the download method is git, as we can not get
> submodules via an http download (via wget).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Aleksandar Simeonov <aleksandar@barix.com>

Tested-By: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Tested on some local packages.  We already had ugly local patches to
support submodules.
