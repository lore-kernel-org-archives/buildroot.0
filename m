From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 07:30:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: fix musl build
In-Reply-To: <20190618163620.28204-1-fontaine.fabrice@gmail.com>
References: <20190618163620.28204-1-fontaine.fabrice@gmail.com>
Message-ID: <20190619073052.3a29de42@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Jun 2019 18:36:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Retrieve upstream patch that check availability of strtoull_l before
> using it
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/18f9eecae551c2db6544c7432f23e541bae0d8b9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0001-Add-detection-of-strtoull_l-function.patch | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
