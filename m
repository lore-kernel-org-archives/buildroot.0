From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 27 Jan 2012 16:55:41 +0100
Subject: [Buildroot] [RFC] python bindings handling
In-Reply-To: <20120127165334.6d1dd39b@skate>
References: <CAGm1_ksToKWTwgAjys49Nop66WwLSdMi7ztC3Zc=g6QHE-7WbQ@mail.gmail.com>
 <20120127165334.6d1dd39b@skate>
Message-ID: <4F22C8FD.8030304@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.01.2012 16:53, schrieb Thomas Petazzoni:
> Le Fri, 27 Jan 2012 16:02:54 +0100,
> Yegor Yefremov <yegorslists@googlemail.com> a ?crit :
> 
>> How should we handle Python and other bindings?
>>
>> 1. check if Python etc is selected and enable them automatically?
>> 2. make an option per package containing bindings
>> 3. something else
> 
> I think I would say 2. It's not because you have Python *and* you have
> some library that you necessarily want the binding for that lib. Just
> make those bindings new Python packages (in the new Python menu you
> created!) and that should be good. No?

Yes. It looks good.

Yegor
