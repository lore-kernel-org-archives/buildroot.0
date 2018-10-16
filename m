From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 16 Oct 2018 12:53:07 -0500
Subject: [Buildroot] More readable buildroot logs
In-Reply-To: <20181016173034.GA22669@smipi1-X1>
References: <20181016173034.GA22669@smipi1-X1>
Message-ID: <CANQCQpbhY5tiMdfv+hcff1k7cH9Mz26ZBC=rpXgK=OTe7x4EDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There was a wrapper script added to provide the "reduced output" at
the console and full br.log saved with detail.  To use this script,
when executing make, use "./util/brmake" (relative to the buildroot
folder).

On Tue, Oct 16, 2018 at 12:30 PM Pieter Smith <pieter@boesman.nl> wrote:
>
> Hi Thomas,
>
> In 2009 you proposed more readable build output for Buildroot:
> http://lists.busybox.net/pipermail/buildroot/2009-September/029248.html
>
> Was there any interest / progress on the topic?
>
> Regards,
> Pieter Smith
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
