From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jul 2016 22:47:18 +0200
Subject: [Buildroot] [PATCH] package/acpitool: not available for bfin
References: <1468778160-32413-1-git-send-email-yann.morin.1998@free.fr>
 <CAK4VdL1HipqOpg5CuYi+KDZiyrLBZQvNLYcDsECLHNC+pqsAiA@mail.gmail.com>
 <20160718183059.GA12720@free.fr>
Message-ID: <m3mf6dx0cb.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 18 Jul 2016 20:30:59 +0200 schrieb Yann E. MORIN:

> Erico, All,
> 
> On 2016-07-18 19:37 +0200, Erico Nunes spake thusly:
>> So it seems to me that acpitool is taking the blame for just being the
>> first C++ package (alphabetically) to be built with the toolchain
>> referenced by these autobuilder failures?
> 
> Maybe. Don't add packages that sort alphabetically-early if you don't
> want to be noticed! ;-)

Hi,

libplatform as cmake-package is also affected:
http://autobuild.buildroot.net/?reason=libplatform-feafe68e3e0b02c3261aefb3d711863ef6fadd38

Regards, Bernd
