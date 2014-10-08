From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 8 Oct 2014 13:43:44 +0200
Subject: [Buildroot] Review of FOSDEM 2014 meeting action points
In-Reply-To: <20141008104845.495ad683@free-electrons.com>
References: <20141008104845.495ad683@free-electrons.com>
Message-ID: <CAAXf6LXXN4YhhZ6uo8XAGSeaZyvh31yfrxSJ5MWA9w-vh5+ptQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 8, 2014 at 10:48 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
>  - Clarification of the meaning of Acked-by/Reviewed-by tag in the
>    Buildroot manual. I think this has been done by Thomas DS. To be
>    confirmed.

Has been updated in the manual, indeed.

>
>  - 'target' defconfigs vs. 'development' configs. This was supposed
>    to be an addition to the Buildroot manual, but it never
>    happened. Not sure this is very important.

I will add this to my todo list for the manual, but do not expect this
to be fixed soon. I indeed don't think it is a very important aspect.

>
>  - Python packages: depends vs .select. Conclusion: we change the
>    handling of optional python bindings: instead of selecting them
>    automatically when python is enabled, we add explicit config
>    symbols for them. ThomasDS will update the patches accordingly.
>
>    Not sure what happened on this topic.

This is still on my list, but currently not at the top.
Main topics I have now for 2014.11 is
a. extension of kconfig-package to linux and barebox, and
b. implement an autobuilder instance
c. remove deprecated packages
d. during the stabilization month: further manual enhancements

Best regards,
Thomas
