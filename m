From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 8 Dec 2015 22:34:22 +0100
Subject: [Buildroot] Help required for adding a package to buildroot
In-Reply-To: <CALSqFvmguj3DE_n+bihR0C3Scox9UYVwVugrvL8Ej1KA4iJtVg@mail.gmail.com>
References: <CALSqFvmguj3DE_n+bihR0C3Scox9UYVwVugrvL8Ej1KA4iJtVg@mail.gmail.com>
Message-ID: <20151208223422.2e00fa78@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anshuman,

On Tue, 8 Dec 2015 16:05:46 +0530, Anshuman Panda <anshuman.c6@gmail.com> wrote:

> Hello there,
> Please someone provide me the the files (config.in & .mk) required to add
> bcm2835 package to buildroot.

General information about this topic can be found here [1] or for a
suggested bcm2835 package take a look at the patch [2] ;-)

If the patch suits your needs feel free to add a Tested-by [3] to it...

Regards,
Peter

[1] https://buildroot.org/downloads/manual/manual.html#adding-packages
[2] https://patchwork.ozlabs.org/patch/554057
[3] https://buildroot.org/downloads/manual/manual.html#_reviewing_and_testing_patches
