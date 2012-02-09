From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 09 Feb 2012 10:08:50 +0100
Subject: [Buildroot] [PATCH v2 2/2] udev: bump to 181 and other fixes
In-Reply-To: <20120209100228.1ad88a30@skate>
References: <1328694625-17204-1-git-send-email-yegorslists@googlemail.com>
 <1328694625-17204-2-git-send-email-yegorslists@googlemail.com>
 <87k43x3ufp.fsf@macbook.be.48ers.dk> <4F33753D.7030002@visionsystems.de>
 <20120209100228.1ad88a30@skate>
Message-ID: <4F338D22.5010801@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 09.02.2012 10:02, schrieb Thomas Petazzoni:
> Le Thu, 09 Feb 2012 08:26:53 +0100,
> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>
>> O.K. Thanks for reviewing and committing. Due to kernel version
>> dependency we can almost retire these toolchains in case of udev:
>>
>> Sourcery CodeBench ARM 2010q1
>> Sourcery CodeBench ARM 2009q3
>> Sourcery CodeBench ARM 2009q1 
> No everybody needs udev, so I don't think it is valid to remove those
> toolchains just because they can't work with udev.

I didn't mean to remove them (how would I get my u-boot compiled?).  I just wanted to state this fact.

Testing ct-ng right now to determine if u-boot is not allergic against it.

Yegor
