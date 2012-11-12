From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 12 Nov 2012 08:46:26 +0100
Subject: [Buildroot] [PATCH] libtool version update 2.4.2
In-Reply-To: <20121111230546.709735e3@skate>
References: <1352464732-22984-1-git-send-email-alexander@mezon.ru>
 <20121110105308.740a3bfa@skate> <50A02018.1000804@mind.be>
 <20121111230546.709735e3@skate>
Message-ID: <50A0A952.5090001@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 11.11.2012 23:05, schrieb Thomas Petazzoni:
> On Sun, 11 Nov 2012 23:00:56 +0100, Arnout Vandecappelle wrote:
>> On 11/10/12 10:53, Thomas Petazzoni wrote:
>>> Alexander,
>>>
>>> On Fri,  9 Nov 2012 16:38:52 +0400, Alexander Khryukin wrote:
>>>
>>>> -LIBTOOL_VERSION = 2.2.10
>>>> +LIBTOOL_VERSION = 2.4.2
>>> How much testing did you give to this version bump? A libtool
>>> version bump is a very sensitive operation, as host-libtool is used
>>> to autoreconfigure many packages in Buildroot. Therefore, this
>>> patch needs a good amount of testing before being committed
>>> (ideally testing that all packages having<foo>_AUTORECONF = YES
>>> still build).
>>   Can't we rely on the autobuilders to do that?
> Sure, we'll certainly rely on the autobuilders for a complete testing.
Hello,

did you ever think about inventing a kind of "testing" branch with a
seperate autobuilder running on? That could keep major build problems
away from the master branch.

Just my 2 cents

Stephan
> But I wanted to know if it had been tested again 2 packages or 20-40
> packages, which makes quite a bit of difference :)
>
>>   That said, I wouldn't do this for 2012.11 anymore...
> For sure, it should not be part of 2012.11, we already have enough
> issues to fix.
>
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
