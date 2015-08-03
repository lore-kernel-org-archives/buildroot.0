From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Mon, 3 Aug 2015 13:05:54 +0300 (IDT)
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.1.2
In-Reply-To: <20150803120134.7d4a133e@free-electrons.com>
References: <1438590279-25769-1-git-send-email-yba@tkos.co.il>
 <20150803111857.69ada16f@free-electrons.com>
 <alpine.DEB.2.11.1508031229090.5593@tanhuma.tkos.co.il>
 <20150803120134.7d4a133e@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1508031305040.5593@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 3 Aug 2015, Thomas Petazzoni wrote:

> Date: Mon, 3 Aug 2015 12:01:34 +0200
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.1.2
> 
> Dear Jonathan Ben Avraham,
>
> On Mon, 3 Aug 2015 12:31:32 +0300 (IDT), Jonathan Ben Avraham wrote:
>
>> The sha1 is the hash from From http://download.zeromq.org/SHA1SUMS
>> The sha256 has is the hash that I generated after verifying the sha1 hash.
>>
>> I assumed that the list prefers a sha256 hash, so I included the original
>> hash for reference.
>
> In this case, just keep both hashes enabled. You can put several hashes
> in a .hash file, all of them are verified.
>
> Thanks!
>
> Thomas
>

So should I submit a PATCH v2?

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
