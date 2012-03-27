From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 27 Mar 2012 11:45:43 +0200
Subject: [Buildroot] [PATCH 1/2] New package: socketcand
In-Reply-To: <20120327113918.006e464b@skate>
References: <1332428460-28459-1-git-send-email-yegorslists@googlemail.com>
 <87ehsk1c2d.fsf@macbook.be.48ers.dk> <20120323095538.5edb8eea@skate>
 <4F6C3D20.8050304@visionsystems.de> <20120323101652.1f1b4b33@skate>
 <CAGm1_ktGv_x0AN2f0kUTzaQjoaiSXFSEfbyOb9n7vU0zjMGtUQ@mail.gmail.com>
 <20120327113918.006e464b@skate>
Message-ID: <4F718C47.6000502@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.03.2012 11:39, schrieb Thomas Petazzoni:
> Hello,
> 
> Le Fri, 23 Mar 2012 10:19:55 +0100,
> Yegor Yefremov <yegorslists@googlemail.com> a ?crit :
> 
>>> No 'make install' ever cares about overwriting existing files, I don't
>>> see why the one of socketcand should.
>>>
>>> What do you think about this option?
>>
>> I agree with you. I'll make a patch and contact the maintainer.
> 
> Any news from this?

I've contacted Jan-Niklas and he wanted to fix the stuff himself next week. He has also integrated a patch to make libconfig optional. I hope to clean up the issues next week.

Yegor
