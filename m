From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 07:39:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libiscsi: needs threads
In-Reply-To: <20190715163702.1978-1-fontaine.fabrice@gmail.com>
References: <20190715163702.1978-1-fontaine.fabrice@gmail.com>
Message-ID: <20190717073928.1f7faca6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jul 2019 18:37:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> threads are needed since bump to version 1.19.0 and
> https://github.com/sahlberg/libiscsi/commit/41af44eba113c59dc43764d1d240397616e85b82
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1d71c95378a6ef9774926bf7431c1a315e4a1b3e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libiscsi/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
