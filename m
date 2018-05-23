From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 23 May 2018 22:38:05 +0200
Subject: [Buildroot] [PATCH] toolchain: GCC bug 85862
In-Reply-To: <20180522230033.0daffecb@windsurf>
References: <1526934582-53824-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180522230033.0daffecb@windsurf>
Message-ID: <21765fd8-362a-0534-69d9-4a2b9d197121@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 22/05/2018 ? 23:00, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Mon, 21 May 2018 15:29:42 -0500, Matt Weber wrote:
>> GCC < 7.x hangs while building libnss for the Microblaze Arch.
>>
>> Discovered by
>> http://autobuild.buildroot.net/results/158e8ebb39713e1b436a5cc1a1916f46c30694df
>>
>> Reported:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862

This bug has been marked as a duclicate of the bug I identified.

>>
>> Simlar to:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=49218
>>
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> Beyond the libnss issue, we do have at least three other Microblaze timeouts. However, I think Romain Naour had identified a different issue for those:
> 
> http://autobuild.buildroot.net/?status=TIMEOUT&arch=microblazeel
> 
> Affected packages: flare-engine, boost, gst-ffmpeg.

We can mark these packages affected by bug 85852 or 85180.

> 
> Romain, Matt, would it be possible to make progress with those timeouts
> as well ?

For now, it's not clear why we have theses timeout with the last microblaze
toolchain bump. Uptream don't recommend to backport this patch "too risky".

Best regards,
Romain

> 
> Thanks a lot!
> 
> Thomas
> 
