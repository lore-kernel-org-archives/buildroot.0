From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 10:30:25 +0100
Subject: [Buildroot] [PATCH 1/2] package/file: add xz optional dependency
In-Reply-To: <20200131180544.1135547-1-fontaine.fabrice@gmail.com>
References: <20200131180544.1135547-1-fontaine.fabrice@gmail.com>
Message-ID: <20200201103025.4d23a8f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jan 2020 19:05:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> xz is an optional dependency since version 5.38 and
> https://github.com/file/file/commit/b259a07ea95827f565faa20f0316e5b2704064f7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/file/file.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
