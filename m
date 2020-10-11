From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Oct 2020 22:57:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/zlib-ng: drop unrecognized CC
 variable
In-Reply-To: <20201011194357.1923003-1-fontaine.fabrice@gmail.com>
References: <20201011194357.1923003-1-fontaine.fabrice@gmail.com>
Message-ID: <20201011225702.0826bdc2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Oct 2020 21:43:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop unneeded CC variable which is not recognized by cmake:
> 
> CMake Warning:
>   Manually-specified variables were not used by the project:
> 
>     BUILD_DOC
>     BUILD_DOCS
>     BUILD_EXAMPLE
>     BUILD_EXAMPLES
>     BUILD_TEST
>     BUILD_TESTING
>     BUILD_TESTS
>     CC
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zlib-ng/zlib-ng.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
