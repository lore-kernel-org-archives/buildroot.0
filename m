From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 02 Oct 2012 18:08:08 +0200
Subject: [Buildroot] [PATCH v3 1/2] pcsc-lite: new package
In-Reply-To: <99B09243E1A5DA4898CDD8B7001114481803AEBA7D@EXMB04.eu.tieto.com>
References: <1348212739-32093-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <50685E64.8040908@mind.be>
 <99B09243E1A5DA4898CDD8B7001114481803AEBA7D@EXMB04.eu.tieto.com>
Message-ID: <506B1168.6020406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/10/12 07:44, Waldemar.Rymarkiewicz at tieto.com wrote:
> Hi,
>
>>   There is also a --enable-usbdropdir which defaults to
>> /usr/local/lib/pcsc/drivers.  We avoid using /usr/local, so could
>> you make that point to /usr/lib/pcsc/drivers?  Or is it anyway
>> not used?
>
> Then we have to set --prefix=/usr as  it defaults to /usr/local. If we do so usbdropdir will be correct as well.

  My bad, --prefix=/usr is already passed to configure.  It's just the help text
that was confusing me.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
