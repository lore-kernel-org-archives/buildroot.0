From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:04:07 +0100
Subject: [Buildroot] [PATCH 1/3] package/uftp: needs MMU,
 threads and wchar
In-Reply-To: <20190319204642.28920-1-fontaine.fabrice@gmail.com>
References: <20190319204642.28920-1-fontaine.fabrice@gmail.com>
Message-ID: <20190319220407.3f3248a3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Mar 2019 21:46:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/47dd067dfdcaae99d50216f59ea6af115d8f1e1e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/uftp/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks. Following my comment on PATCH 2/3, I have
marked PATCH 2/3 and 3/3 as Changes Requested in Patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
