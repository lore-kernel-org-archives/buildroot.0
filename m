From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jun 2016 12:18:48 -0300
Subject: [Buildroot] [PATCH] glibc: bump default to version 2.23
In-Reply-To: <20160622171317.79fbea7e@free-electrons.com>
References: <1466590187-21862-1-git-send-email-gustavo@zacarias.com.ar>
 <87r3bpwa02.fsf@dell.be.48ers.dk>
 <42d8119e5e64c7a67018770b3f029146@zacarias.com.ar>
 <20160622171317.79fbea7e@free-electrons.com>
Message-ID: <312f3b85fab01ed234da9ff79ac982d0@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-06-22 12:13, Thomas Petazzoni wrote:

> Default to n-1 has been our tradition for gcc/binutils/glibc for ages.
> 
>> We're using latest uclibc-ng if it's suitable/for example.
> 
> Cause uclibc-ng doesn't evolve much beyond bug fixes at the moment, so
> there's not really a good reason to not use the latest version.
> 
> Thomas

Hi.
There are outstanding security bugs that haven't been patched in 
buildroot for 22/23 yet which are fixed in the upcoming 24 release, and 
22 has fixes on top of 23 already.
And these patches need rebasing between 22 and 23, so i'd rather keep 
moving forward with them than backward.
By introducing 23 as stable sooner in the development cycle rather than 
later we can spot issues quicker while also avoiding unnecessary work in 
backporting security patches across a broader spectrum.
Regards.
