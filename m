From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon, 24 Oct 2016 11:54:23 +1100
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <20161019221035.2350c181@free-electrons.com>
References: <20161019221035.2350c181@free-electrons.com>
Message-ID: <20161024005421.GA2747@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 19, 2016 at 10:10:35PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> >From Friday to Sunday last week, a Buildroot Developers meeting was
> organized in Berlin, right after the Embedded Linux Conference Europe.

[snip]

>  - Improving the developer experience when using _OVERRIDE_SRCDIR or
>    "local" packages. Currently, since the source code is copied in the
>    build directory, the build errors and warnings refers to the build
>    directory. That's not convenient for users running an IDE, since
>    clicking on the warning or error does not bring to the correct
>    file. After much discusion, it appears that the only reasonable
>    solution is to implement per-package out-of-tree build.

Great! Will this allow the use of --delete with the rsync that copies the
source? (It would fix the problem caused by certain moved/renamed files in your
source directory when using _OVERRIDE_SOURCEDIR.)

Cheers,
Sam.
