From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Jun 2019 11:52:31 +0200
Subject: [Buildroot] [PATCH v3] mfgtools: bump revision to latest uuu
 version
In-Reply-To: <20190611081559.GA24465@t450s.lan>
References: <20190608105337.19879-1-bisson.gary@gmail.com>
 <cfe0721d-fbce-bb84-cf59-6353d7348ab8@mind.be>
 <20190611081559.GA24465@t450s.lan>
Message-ID: <1f9e1d82-380b-bc03-475f-5c3283ac7f7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/06/2019 10:15, Gary Bisson wrote:
>>  So, I'm in favour of creating BR2_PACKAGE_HOST_UUU and killing
>> BR2_PACKAGE_HOST_MFGTOOLS.
>>
>>  I marked the patch as Not Applicable in patchwork. If you convince me to do it
>> this way after all, we can fish it up again.
> 
> Ok I can do that. I'll offer another series that deprecates mfgtools and creates
> a new uuu package.

 Maybe first Peter and Thomas can confirm that this is the right approach?

 In summary: the current version of mfgtools creates a completely different
program called uuu that is used in a completely different way. In other words,
existing scripts will no longer work. Because of this, my proposal is to create
a new package for it, and move the existing mfgtools to legacy.

 Regards,
 Arnout
