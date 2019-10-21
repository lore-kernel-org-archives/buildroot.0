From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:45:01 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/ltp-testsuite: enable build
 under musl
In-Reply-To: <20191017221827.2852-1-petr.vorel@gmail.com>
References: <20191017221827.2852-1-petr.vorel@gmail.com>
Message-ID: <20191021214501.40154f43@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Oct 2019 00:18:27 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> This requires to remove a lot of broken code until it's fixed in upstream.
> Added 2 patches from upcoming release.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v2->v3:
> * improve commit message (sorry for noise)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
