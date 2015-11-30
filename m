From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 Nov 2015 23:24:12 +0100
Subject: [Buildroot] [PATCH v5 1/2] package/unscd: new package
In-Reply-To: <20151130232238.401bc727@free-electrons.com>
References: <1448287096-18606-1-git-send-email-rdkehn@yahoo.com>
 <1448287096-18606-2-git-send-email-rdkehn@yahoo.com>
 <20151130224457.4baa3ab6@free-electrons.com> <565CCAEE.7070503@mind.be>
 <20151130232238.401bc727@free-electrons.com>
Message-ID: <565CCC8C.3080106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-11-15 23:22, Thomas Petazzoni wrote:
> Arnout,
> 
> On Mon, 30 Nov 2015 23:17:18 +0100, Arnout Vandecappelle wrote:
> 
>>>>>> unscd 0.51 Patching
>>> support/scripts/apply-patches.sh  /home/thomas/projets/buildroot/output/build/unscd-0.51 /home/thomas/projets/buildroot/output/build/unscd-0.51/debian/patches
>>> Unsupported file type for /home/thomas/projets/buildroot/output/build/unscd-0.51/debian/patches/change_invalidate_request_info_output, skipping
>>> Unsupported file type for /home/thomas/projets/buildroot/output/build/unscd-0.51/debian/patches/support_large_numbers_in_config, skipping
>>
>>  Uh, that shouldn't happen, since 7caf464 everything in the series file should
>> be applied regardless of name...
> 
> I tested on top of next, so it should have worked... but it did not. I
> didn't check if the patches were actually applied, but it is clear that
> this message was displayed, since I copy/pasted from my terminal.

 7caf464 was applied to master only, and there has been no merge from master to
next. So that explains it.

 next will be gone soon so don't worry ;-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
