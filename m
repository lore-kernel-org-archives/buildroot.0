From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:41:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/poppler: add boost optional
 dependency
In-Reply-To: <20210119180542.497919-1-fontaine.fabrice@gmail.com>
References: <20210119180542.497919-1-fontaine.fabrice@gmail.com>
Message-ID: <20210121224134.764b51df@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Jan 2021 19:05:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> boost is an optional dependency which is enabled by default since
> version 0.80.0 and
> https://github.com/freedesktop/poppler/commit/355fd8d58ca0209284fe568b3add28f207e995c1
> 
> There is no cmake option to enable or disable this dependency
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/poppler/poppler.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
