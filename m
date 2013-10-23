From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Wed, 23 Oct 2013 22:26:55 +0200
Subject: [Buildroot] package libfreefare: site url question
In-Reply-To: <52682A5A.1000708@mind.be>
References: <CACjG4BLNti1J9rH0Ks1jJnyGX=JztNJteMXp62x-zg43XHyeWw@mail.gmail.com>
 <52682A5A.1000708@mind.be>
Message-ID: <CACjG4BJRacJsDEv-xeiNMm4mzrAgaY6Ta9BawtNw3MUd6X5Nkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok that's what I was thinking, just wanted to be sure before posting a
patch.

Thanks,

Arnaud


2013/10/23 Arnout Vandecappelle <arnout@mind.be>

> On 18/10/13 13:23, arnaud aujon wrote:
>
>> Hi,
>>
>> I noticed that libfreefare package refers to the site
>> nfc-tools.googlecode.com <http://nfc-tools.googlecode.**com<http://nfc-tools.googlecode.com>>,
>> even if the
>>
>> current archive (libfreefare-0.3.4) is present in nfc-tools repository,
>> it seems better to use the libfreefare repository
>> (libfreefare.googlecode.com <http://libfreefare.**googlecode.com<http://libfreefare.googlecode.com>
>> >).
>>
>> Is there a reason for that ?
>>
>
>  Given that nobody has answered yet: I don't think there's a specific
> reason for that. The two packages were added to buildroot at the same time;
> maybe libfreerare didn't exist yet as a separate project.
>
>  You'll probably find other cases where the upstream site is no longer
> accurate.
>
>  Regards,
>  Arnout
>
>  As i'm working on a script to automatically check updates, it would be
>> way easier for me :)
>>
>>
>> ______________________________**_________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/**mailman/listinfo/buildroot<http://lists.busybox.net/mailman/listinfo/buildroot>
>>
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131023/9b022554/attachment.html>
