From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 22:40:49 +0100
Subject: [Buildroot] [PATCH 1/1] openmpi: bump to version 4.0.0
In-Reply-To: <20190129193525.26908-1-fontaine.fabrice@gmail.com>
References: <20190129193525.26908-1-fontaine.fabrice@gmail.com>
Message-ID: <20190204224049.3796b843@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 29 Jan 2019 20:35:25 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add hash for licence file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openmpi/openmpi.hash | 9 +++++----
>  package/openmpi/openmpi.mk   | 4 ++--
>  2 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks. Please remember to use package/<foo> as the
prefix for your future package-related patches. Thanks

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
