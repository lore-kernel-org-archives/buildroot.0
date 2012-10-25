From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 25 Oct 2012 09:28:12 +0200
Subject: [Buildroot] [PATCH] qtuio: new package
In-Reply-To: <CAHXCMM+vueN0425tdmpVQKH=dczLurJBynquR2LnyF-QMon9Rg@mail.gmail.com>
References: <1348297189-29498-1-git-send-email-sho@relinux.de>
 <20121025085632.30c9878f@skate>
 <CAHXCMM+vueN0425tdmpVQKH=dczLurJBynquR2LnyF-QMon9Rg@mail.gmail.com>
Message-ID: <5088EA0C.6090205@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 25.10.2012 09:09, schrieb Samuel Martin:
>> Looks like it breaks the build in certain configurations:
>> http://autobuild.buildroot.net/results/c4a12fe6b8e7eb8c31ee2fd48893480bd098a008/build-end.log
>>
>> It seems like a debug version of the library, named libqTUIO_d.so, has
>> been generated, which prevents the install rules from working.
> I've a fix for this one:
> https://github.com/tSed/buildroot/commit/b6297fd555f3288e0c3a1b3831706876aed3518c
>
> I'll post it later on the ml.
>
Thank you, Samuel. I just wanted to start to investigate.

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
