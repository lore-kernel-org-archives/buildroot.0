From: Charles Hardin <charles.hardin@storagecraft.com>
Date: Thu, 28 Jun 2018 21:36:25 +0000
Subject: [Buildroot] [PATCH v2 2/5] package/protobuf: add a patch for
 mips big endian
In-Reply-To: <20180628223441.43372ad7@windsurf>
References: <20180521175310.18563-1-charles.hardin@storagecraft.com>
 <20180521175310.18563-3-charles.hardin@storagecraft.com>
 <20180628223441.43372ad7@windsurf>
Message-ID: <F89F5134-B038-4D91-93FF-C3AE7250477F@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yeah...

> On Jun 28, 2018, at 1:34 PM, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> Hello,
> 
> On Mon, 21 May 2018 10:53:07 -0700, charles.hardin at storagecraft.com
> wrote:
>> From: Charles Hardin <charles.hardin@storagecraft.com>
>> 
>> This patch got submitted as a pull upstream, but hasn't
>> been approved or yanked in yet. So, adding it here
>> for now until an upstream solution is determined.
>> 
>> Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
>> ---
>> ...w-a-compilation-under-mips-big-endian-wit.patch | 38 ++++++++++++++++++++++
>> 1 file changed, 38 insertions(+)
>> create mode 100644 package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch
> 
> I've applied to master. However your pull request to the upstream
> protobuf project has been closed, because you did not sign the CLA:
> https://github.com/google/protobuf/pull/4657. Could you follow that
> process to make sure your patch gets merged upstream ?
> 

Looks like email confusion - reposted and it should be able to go thru.

It is unclear if there is any intention on protobuf to support mips big endian
anyway.

> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
