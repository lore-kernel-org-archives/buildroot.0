From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 22:45:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: add protobuf option
In-Reply-To: <20200111150143.1253117-1-fontaine.fabrice@gmail.com>
References: <20200111150143.1253117-1-fontaine.fabrice@gmail.com>
Message-ID: <20200112224504.52524861@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jan 2020 16:01:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Currently, protobuf is built unconditionnally since version 3.3.0 and
> https://github.com/opencv/opencv/commit/1c4c58d1b5b7430463281e8c8072e04245f561b0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/opencv3/Config.in  | 12 ++++++++++++
>  package/opencv3/opencv3.mk |  8 ++++++++
>  2 files changed, 20 insertions(+)

I've applied after improving the commit title and commit log, as we
discussed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
