From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jul 2016 18:18:30 -0500
Subject: [Buildroot] [PATCH v2] iperf: fix "speed" display in CSV report
In-Reply-To: <20160728233547.68a4656d@free-electrons.com>
References: <1469725165-18180-1-git-send-email-matthew.weber@rockwellcollins.com>
 <037EF233-5A06-45DC-A231-55ED9B186CD9@gmail.com>
 <20160728233547.68a4656d@free-electrons.com>
Message-ID: <CANQCQpY8X9NzLRQOTtoJEJzHbMM0m856azXJWk18qm2kVVZtDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Thu, Jul 28, 2016 at 4:35 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 28 Jul 2016 10:46:44 -0700, Khem Raj wrote:
>
>> c99 says if you are printing uint64_t then its portable to use PRIu64 e.g.
>>
>> uint64_t a_int64
>> printf("%" PRId64 "\n?, a_int64);
>
> Indeed. Matt, could you rework your patch accordingly?
>

Sure.

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
