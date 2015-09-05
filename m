From: =?UTF-8?B?Q8OpZHJpYyBNYXJpZQ==?= <cedric.marie@openmailbox.org>
Date: Sat, 05 Sep 2015 23:18:48 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <55E4D689.30103@mind.be>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>
 <5578B394.1010503@mind.be> <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
 <5579E9EF.4070402@mind.be> <0d88f0bd848eeb62c868dc2d5dffe496@openmailbox.org>
 <55870F2F.4080700@mind.be> <4fd6c4c54bc90972d20b6f04b62b227e@openmailbox.org>
 <CAHXCMMJWjiKVCi-vjWftDgAxq7JDN+You3Go-NCvQVS81AC1Cw@mail.gmail.com>
 <7f746aa9c68a301002cdca28b6cb3f51@openmailbox.org>
 <CAHXCMM+-eyJRSa5c8WAtqptC0MTbJNBb4bZdhBBaY3yxYvAauw@mail.gmail.com>
 <0494936f4284565201a58a70d0a3c08d@openmailbox.org>
 <ae20692cc561152ac16a33820206a599@openmailbox.org> <55D9016F.5080602@mind.be>
 <20150831092822.521c2c72@free-electrons.com> <55E449F9.90407@openmailbox.org>
 <55E4D689.30103@mind.be>
Message-ID: <55EB5C38.5090303@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've just sent the patch with my modifications.

 >> we turn it to quiet by
 >> forcing explicit V=0.
>   Perhaps we could do that when V=0 is passed explicitly on buildroot's top-level
> make.

That's what I've done. I'm not sure whether it should be added in 
Buildroot doc (8.1: make tips) or not, since it is specific to autotools 
and has no effect on other packages.


>   BTW, this stuff should also be tested from an output directory and with a
> non-022 umask.

I have checked with O=... and with a different umask: the V option is 
correctly forwarded.


-- 
C?dric
