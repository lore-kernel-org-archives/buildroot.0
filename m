From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Mon, 3 Aug 2015 12:31:32 +0300 (IDT)
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.1.2
In-Reply-To: <20150803111857.69ada16f@free-electrons.com>
References: <1438590279-25769-1-git-send-email-yba@tkos.co.il>
 <20150803111857.69ada16f@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1508031229090.5593@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 3 Aug 2015, Thomas Petazzoni wrote:

> Date: Mon, 3 Aug 2015 11:18:57 +0200
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.1.2
> 
> Dear Jonathan Ben-Avraham,
>
> On Mon,  3 Aug 2015 11:24:39 +0300, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>> ---
>>  ....m4-make-kernel-specific-flags-cacheable.patch} |    0
>>  ...isable-test_fork-if-fork-is-not-available.patch |   52 --------------------
>>  ...-Fix-pkg-config-files-for-static-linking.patch} |    0
>>  package/zeromq/0004-allow-without-libsodium.patch  |   38 --------------
>
> Could you explain in the commit log why some of the patches are being
> removed? Like if they are now upstream, point to the upstream commit?
>
>> diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
>> index 729e7ea..0d33431 100644
>> --- a/package/zeromq/zeromq.hash
>> +++ b/package/zeromq/zeromq.hash
>> @@ -1,2 +1,4 @@
>>  # Locally calculated from download (no sig, hash)
>> -sha256	3bc93c5f67370341428364ce007d448f4bb58a0eaabd0a60697d8086bc43342b	zeromq-4.0.5.tar.gz
>> +sha256	f9162ead6d68521e5154d871bac304f88857308bb02366b81bb588497a345927	zeromq-4.1.2.tar.gz
>> +# From http://download.zeromq.org/SHA1SUMS:
>> +#sha1	86c17096f7f4bf46cbcd2ad242cf8fec8a7cfb7b	zeromq-4.1.2.tar.gz
>
> Why are you adding the SHA1, but commented out?
>
> Thanks a lot!
>
> Thomas

The sha1 is the hash from From http://download.zeromq.org/SHA1SUMS
The sha256 has is the hash that I generated after verifying the sha1 hash.

I assumed that the list prefers a sha256 hash, so I included the original 
hash for reference.

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
