From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 03 Apr 2012 07:09:53 -0300
Subject: [Buildroot] [git commit] libpng: bump to version 1.4.10
In-Reply-To: <20120403102306.5a46d638@skate>
References: <20120402211515.2D2F6969C3@busybox.osuosl.org>
 <20120403102306.5a46d638@skate>
Message-ID: <49c17c14e3a4120f08e1ac087d6dcf19@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-03 05:23, Thomas Petazzoni wrote:

> This breaks the build:
>
> 
> http://autobuild.buildroot.org/results/8aa42940f3fb2c7af5568354c906a3f3c1d5eaab/build-end.log
> 
> http://autobuild.buildroot.org/results/470b28f443877094ac22121f9c3ff88541a82f34/build-end.log
> 
> http://autobuild.buildroot.org/results/bc174de9d816da26d151513c3eeb6630a3cdbf98/build-end.log
>
> And many, many other occurrences.
>
> Thomas

They've just released 1.4.11 because of a security bug fix, proper 
action would be to bump it.
It's unfortunate when they archive older versions, though 
understandable if they are vulnerable to security bugs.
Regards.
