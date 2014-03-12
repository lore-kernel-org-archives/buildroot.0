From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 12 Mar 2014 18:02:49 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: bump to v208.
In-Reply-To: <87fvmnpesy.fsf@dell.be.48ers.dk>
References: <1394635785-27317-1-git-send-email-eric.le.bihan.dev@free.fr>
 <87fvmnpesy.fsf@dell.be.48ers.dk>
Message-ID: <CAHXCMM+Dqt+y2n=1uw8BbW2wBV0mLGGQgO2FPPOcDK1DcN+HnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Wed, Mar 12, 2014 at 5:22 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:
>
>  > This version bump comes with a patch, backported from v209, to fix
>  > a linker error when EFI support is disabled.
>
> Why v208? v211 has been released.

Last time I checked, eudev in sync with systemd v210, it seems this
has not changed since.
Do we want to care about this synchronization between the udev
provided by systemd and the one from eudev?

Regards,

-- 
Samuel
