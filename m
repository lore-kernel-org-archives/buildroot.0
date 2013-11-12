From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Nov 2013 09:02:45 +0100
Subject: [Buildroot] Make Acked/Reviewd/Tested-by tags visible
In-Reply-To: <20131112075831.5d00efd8@skate>
References: <20131111215435.GC3510@free.fr> <52817846.2080301@ozlabs.org>
 <20131112075831.5d00efd8@skate>
Message-ID: <CAAXf6LWtpkq7Hx-A_vJFhFr983_0H-KFLcussWoi7s7rFAK_dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Nov 12, 2013 at 7:58 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>> Other projects have different policies for their tagging (some require 3
>> acks, for example), which will introduce a little complexity there too,
>> but that's not insurmountable either.
>
> Another thing that comes to mind is that not all Acked-by or Tested-by
> are equal, I believe. An Acked-by from a well-known long-time
> contributor will not be seen with the same level of trust that an
> Acked-by from an unknown newcomer. Do we want to add a mechanism of
> "rating"? But that would mean the project maintainer would have to
> "rate" developers, which is not nice. Or maybe just a list of e-mails
> that the project's maintainer considers as trustworthy, and only those
> ones would be taken into account when displaying the ART flags?
>
> Or maybe it doesn't matter too much, since in the vast majority of
> cases, only well-known long-time contributors are doing reviews/acks.

Patchwork already has the concept of maintainers, that is a list of
people having patchwork change privileges. Maybe it is sufficient to
differentiate Acked/Reviewed/Tested from either maintainer or
non-maintainer? It would not require additional administration.

Best regards,
Thomas
