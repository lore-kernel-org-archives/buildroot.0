From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Thu, 27 Feb 2020 07:10:35 +0000
Subject: [Buildroot] [PATCH v2] package/fswebcam: bump to latest git
 version
In-Reply-To: <20200226213801.64454e3c@windsurf>
References: <20200224074146.3008-1-eugen.hristev@microchip.com>
 <20200226213801.64454e3c@windsurf>
Message-ID: <8c1da465-2f2c-028d-788a-9eceab1cc5d3@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26.02.2020 22:38, Thomas Petazzoni wrote:

> On Mon, 24 Feb 2020 09:41:46 +0200
> Eugen Hristev <eugen.hristev@microchip.com> wrote:
> 
>> Bump to latest git version.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
>> ---
>> Changes in v2:
>> - use buildroot github API to call for tar download
>>
>>
>>   package/fswebcam/fswebcam.hash | 1 +
>>   package/fswebcam/fswebcam.mk   | 5 ++---
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/fswebcam/fswebcam.hash b/package/fswebcam/fswebcam.hash
>> index 28f604547c..ee9bebd106 100644
>> --- a/package/fswebcam/fswebcam.hash
>> +++ b/package/fswebcam/fswebcam.hash
>> @@ -1,3 +1,4 @@
>>   # Locally calculated
>>   sha256  444d6a8a82102e09e935540c64a731021de36db03e1e74181f41ca6f39aa6474  fswebcam-20140113.tar.xz
> 
> You forgot to remove the hash of the old tarball here. So I dropped
> this, and applied your patch to our next branch. Thanks!

Thanks as well. I intentionally left it there. I am unsure about the 
policy of keeping old hashes there. So I preferred not to touch it.

> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
