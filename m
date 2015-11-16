From: Rodrigo Rebello <rprebello@gmail.com>
Date: Mon, 16 Nov 2015 08:15:56 -0200
Subject: [Buildroot] [PATCH v2 1/1] qemu: add patch to fix SSP support
	detection
In-Reply-To: <56497878.6080500@mind.be>
References: <1447280301-9225-1-git-send-email-rprebello@gmail.com>
 <5643CF83.6000800@mind.be>
 <CABLs7GXMFP-vm1tRx1zcQZAsJ+KXUV8JNqxLN+3qPhGbNDL50w@mail.gmail.com>
 <56444B9D.3060501@mind.be>
 <CABLs7GU_RV8FOsFBqPB+Rz8nfHXFUaRF8PQrksk1MsrHQ7b4JA@mail.gmail.com>
 <56458CCD.6030305@mind.be>
 <CABLs7GXiOVap1qiJw4URKFMusfBe6FRuejb9eCHt02aiMz_okQ@mail.gmail.com>
 <56497878.6080500@mind.be>
Message-ID: <CABLs7GVvKkHRAdLGbWTjiB9CHaHvFh+o9pOXEZU2LNe+8ieuUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

2015-11-16 4:32 GMT-02:00 Arnout Vandecappelle <arnout@mind.be>:
[snip]
>
>  No need to wait to submit it to buildroot IMHO.
>
>>
>> On the other hand, modifying the gcc wrapper to error out on
>> -fstack-protector-* when SSP is unsupported is straightforward and
>> I've already cooked up a patch for that. I could send it immediately
>> and maybe mark this qemu-specific patch as rejected or superseded.
>
>  Yes, please do send that patch. It is however something that will probably only
> be applied to next, while the qemu patch can be applied to master, so you should
> probably send both of them.
>

OK then, I'll send them both and mark this one as superseded.

Regards,
Rodrigo

>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
