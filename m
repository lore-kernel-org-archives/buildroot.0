From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:06:22 +0200
Subject: [Buildroot] [PATCH] package/json-c: bump to version 0.14
In-Reply-To: <20200430022505.6767-1-ryanbarnett3@gmail.com>
References: <20200430022505.6767-1-ryanbarnett3@gmail.com>
Message-ID: <20200827230622.5336fa4a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Apr 2020 21:25:05 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> * Switch to cmake infrastructure
> * Update hash file to two space format
> 
> Results of test-pkg:
> 
>   $ ./utils/test-pkg -c json-c.config -p json-c
>                              br-arm-full [1/6]: OK
>                   br-arm-cortex-a9-glibc [2/6]: OK
>                    br-arm-cortex-m4-full [3/6]: OK
>                           br-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
>   6 builds, 0 skipped, 0 build failed, 0 legal-info failed
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  package/json-c/json-c.hash |  4 ++--
>  package/json-c/json-c.mk   | 14 +++-----------
>  2 files changed, 5 insertions(+), 13 deletions(-)

Sorry, another patch posted by Christopher Pelloux doing the same thing
got merged, even though it was posted after yours. Sorry about that :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
