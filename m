From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:25:29 +0200
Subject: [Buildroot] [PATCH v2] package/glibc: ARC: use upstream 2.32
In-Reply-To: <20200916073033.1298697-1-vgupta@synopsys.com>
References: <20200916073033.1298697-1-vgupta@synopsys.com>
Message-ID: <20200919222529.2f8c694e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 00:30:33 -0700
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> ARC glibc port was merged upstream in 2.32
> There's no need to refer to github as it has the exact same version and
> can be retired in future.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
> Changes since v1:
>   - dropped artifacts related to github version
> ---
>  .../glibc.hash                                |  2 ++
>  package/glibc/arc-2020.03-release/glibc.hash  |  7 -------
>  package/glibc/glibc.mk                        | 20 ++++++++++---------
>  3 files changed, 13 insertions(+), 16 deletions(-)
>  create mode 100644 package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
>  delete mode 100644 package/glibc/arc-2020.03-release/glibc.hash

I've added the hashes of the license files in the glibc.hash you've
added, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
