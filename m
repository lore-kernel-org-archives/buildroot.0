From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 8 Oct 2014 11:40:37 -0500
Subject: [Buildroot] Review of FOSDEM 2014 meeting action points
In-Reply-To: <20141008104845.495ad683@free-electrons.com>
References: <20141008104845.495ad683@free-electrons.com>
Message-ID: <CANQCQpbFSvHF9Q+Yo59H5NMVR31-JdR69Aao64popVHCt3QsVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Oct 8, 2014 at 3:48 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> In preparation for the upcoming developers meeting on Saturday/Sunday,
> I had a look at all the topics/action points from the FOSDEM 2014
> meeting, and tried to see which ones were implemented, which ones were
> not. The idea is to create some discussion around those action points,
> and see if anything needs to be done about the remaining one, discussed
> this week-end, etc.
>
<snip>
>
>  - State of major patch sets
>
>    - Systemd/udev support. Has been merged.
>    - Perl package infra. Has been merged.
>    - SELinux. Still not merged, but not really pushed actively
>      anymore.

We are preparing an updated SELinux patch set and hope to have it
submitted in the Nov-Dec time frame (finally got some funding to
finish this work).  For this time around, we've been doing some extra
testing in hopes the merge doesn't break things to badly.  There are a
number of RFC items that we'll be posting in the weeks to come
(covering documentation, defconfig examples, handing target skeleton
changes, etc.)


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
