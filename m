From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 10 Aug 2016 15:48:38 -0500
Subject: [Buildroot] [PATCH] lxc: version bump to 2.0.3
In-Reply-To: <20160810223905.41faf40a@free-electrons.com>
References: <1470858192-29796-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160810223905.41faf40a@free-electrons.com>
Message-ID: <CANQCQpbmvKn82AugTx+Cn9dut9L3ju5tJuZcv0DECp9D5PHmMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Aug 10, 2016 at 3:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Thanks for this patch. A few questions below.
>
> On Wed, 10 Aug 2016 14:43:12 -0500, Matt Weber wrote:
>> From: Judd Meinders <judd.meinders@rockwellcollins.com>
>>
>> - Removed IPv6 and werror patches as changes where
>>   incorporated upsteam.
>>
>> - AUTO_RECONF is kept for libseccomp conf opt purposes
>>   (other packages don't explicitly comment this when
>>    kconfig conditionals are used)
>
> Could you give more details here? Also, your justification to not add a
> comment on top of AUTORECONF = YES sounds bogus. If there is an
> AUTORECONF = YES, then there must be a comment on top of it that
> explains why.

We debated on leaving the comment in.  How does this sound?

# Re-configuring to selectively use libseccomp

Thanks

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
