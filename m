From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 30 Apr 2015 11:23:33 -0500
Subject: [Buildroot] [PATCH 1/1] busybox: udhcpc create leases file
In-Reply-To: <87vbgdvezw.fsf@dell.be.48ers.dk>
References: <1430358118-5304-1-git-send-email-matt@thewebers.ws>
 <87zj5pvgba.fsf@dell.be.48ers.dk>
 <CANQCQpaw-Ft7NFRCHYns6em8GU78+LBvU-2yhZapqOMxzH_VFg@mail.gmail.com>
 <87vbgdvezw.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpbEXGjcEVcj+b61kJiEvD9oEk-zWSgr+SDU6Q2mYsmN7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Thu, Apr 30, 2015 at 9:59 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>
> Hi,
>
>  >> > +            # Based on http://sourceforge.net/p/kboot/mailman/message/1168535/
>  >>
>  >> A more detailed commit message would be good. After looking at that URL
>  >> I'm still not quite sure what this is needed for? It doesn't seem to be
>  >> read again anywhere.
>
>  > Sorry, I can add that.  In general, it adds the leases functionality
>  > that mimics full dhclient behavior.  This file can then be used at a
>  > system level to know least expiration and other server provided
>  > information.
>
> Ok, good. Is that really something we want to enforce for everyone using
> udhcpc with Buildroot?

Possibly not.  I'm good with doing a hook script for now.  Half of my
sending this patch in was to just publish the concept if anyone else
wants to use/add to it.

Thanks!

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
