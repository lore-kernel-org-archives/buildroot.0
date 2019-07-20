From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 21:58:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/zeromq: fix sha256 hash
In-Reply-To: <20190714142504.30546-1-fontaine.fabrice@gmail.com>
References: <20190714142504.30546-1-fontaine.fabrice@gmail.com>
Message-ID: <20190720215845.22cfc05c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jul 2019 16:25:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Bump to version 4.3.2 did not update sha256 hash
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zeromq/zeromq.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
