From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 26 Feb 2015 20:25:27 +0100
Subject: [Buildroot] [PATCH 00/13] autobuild-run: python3 compat and
	misc improvements
In-Reply-To: <20150226110858.183d31f3@free-electrons.com>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
 <20150226110858.183d31f3@free-electrons.com>
Message-ID: <EEF2BEA7-3CA2-4250-8E78-E2585246EE66@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On February 26, 2015 11:08:58 AM CET, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>Dear Andr? Erdmann,
>
>On Wed, 25 Feb 2015 22:17:17 +0100, Andr? Erdmann wrote:
>> Patches 1-4 make autobuild-run compatible with both python >=2.6 and
>3.
>> 
>> Patches 5-9 are minor enhancements (mostly cleanup).
>> 
>> Patches 10- are more invasive:
>> * move the check_requirements() logic to the SystemInfo class
>> * control environment(->locale), std{in,out,err} of all called
>commands
>
>Thanks a lot all those patches. Overall they look very useful!
>
>I really need to spend some time to merge the patches proposed by
>Thomas DS, and then your patches. I would still like to give the
>priority to Thomas DS patches, since they have been in the queue for a
>very long time.
>

Andr?,

Could you give your personal feedback on the usage of docopt in my patches? Do
 you think it is an improvement or rather an unnecessary dependency?

ThomasP has a different opinion than me, and there haven't been many other
 opinions so far. Your input is this most definitely welcome, no matter which side
 you choose.

Thanks,
Thomas
