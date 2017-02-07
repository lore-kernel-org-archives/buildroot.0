From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 7 Feb 2017 17:37:45 +0000 (UTC)
Subject: [Buildroot] Interaction between SITE_METHOD=LOCAL and .patch
	files
References: <o7araj$clq$1@blaine.gmane.org>
 <0a532bbd-e625-a41e-ece3-6974bd63d4a2@mind.be>
 <o7cvgb$209$1@blaine.gmane.org>
Message-ID: <o7d0l8$c5k$1@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-02-07, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> On 2017-02-07, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>>> After comparing build trees that worked with build trees that failed,
>>> I finallythat setting SITE_METHOD = LOCAL prevents the application of
>>> the .patch files present in the package directory. 
>>
>> It does.
>
>>  Indeed, it should be documented. Care to send a patch?
>
> Will do.

Is it just the .patch files found in the package directory that are
skipped in the [FOO_SITE_METHOD = local] case?  Or are all patches
skipped (also skipping those specified by FOO_PATCH and
BR2_GLOBAL_PATCH_DIR)?

-- 
Grant Edwards               grant.b.edwards        Yow! Alright, you!!
                                  at               Imitate a WOUNDED SEAL
                              gmail.com            pleading for a PARKING
                                                   SPACE!!
