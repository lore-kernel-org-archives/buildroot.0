From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Apr 2019 23:24:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: fix static build with
 openssl and atomic
In-Reply-To: <20190409210652.26052-1-fontaine.fabrice@gmail.com>
References: <20190409210652.26052-1-fontaine.fabrice@gmail.com>
Message-ID: <20190409232457.64fa4f2f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  9 Apr 2019 23:06:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update patch so -latomic (provided in LIBS) is added after openssl libs
> (provided in $3)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4b90b7d02e354ebf3d8f95023547bf4a18e0165e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-static-linking-with-OpenSSL.patch   | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Applied to master, thanks. Ah, pkg-config would be nicer :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
