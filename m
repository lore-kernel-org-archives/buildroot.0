From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 2 Oct 2014 13:06:49 -0500
Subject: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.0
In-Reply-To: <87h9zmmjuv.fsf@dell.be.48ers.dk>
References: <1412214757-3948-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87h9zmmjuv.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpbLLeGN4o3Ab=OnCRxLdk-1mqRzahBq_pexVwR6izM3hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Thu, Oct 2, 2014 at 1:01 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > * Adds powerpc architecture support
>  > * Changes to the new github upstream site
>  > * Updates the license filename
>
>  > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>  > ---
>
>  >  PROTOBUF_LICENSE = BSD-3c
>  > -PROTOBUF_LICENSE_FILES = COPYING.txt
>  > +PROTOBUF_LICENSE_FILES = LICENSE
>
> Huh?

Oh sorry, I looked at the latest in there repo instead of their tag
for 2.6.0 (so 2.7 will have that).  I'll update and resubmit.

>
> make protobuf-legal-info
> cat: /home/peko/source/buildroot/output/build/protobuf-2.6.0/LICENSE: No such file or directory
>
> I see there's still a COPYING.txt
>
> --
> Bye, Peter Korsgaard



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
