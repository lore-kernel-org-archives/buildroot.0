From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Fri, 30 Dec 2016 21:22:02 -0200
Subject: [Buildroot] [PATCH] eudev: build with older kernels.
In-Reply-To: <CAPdpN3D9yXBcCLrPxbgW-xXfoOrwqXjr1Mx88K7Mk6cpJqkSvw@mail.gmail.com>
References: <CAPdpN3AqMidYkSkAdjUygBzkXfVMELex3wjtsgyxqwiQdrr3zQ@mail.gmail.com>
 <20161230153238.10458-1-barbieri@profusion.mobi>
 <87vau186qk.fsf@dell.be.48ers.dk>
 <CAPdpN3D9yXBcCLrPxbgW-xXfoOrwqXjr1Mx88K7Mk6cpJqkSvw@mail.gmail.com>
Message-ID: <CAPdpN3C5s=sd9nvbLab=EkA536vw0EQ30OP+C5iPkFdb3gPFww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

it's merged upstream, should be in the next release

https://github.com/gentoo/eudev/pull/139

On Fri, Dec 30, 2016 at 8:33 PM, Gustavo Sverzut Barbieri
<barbieri@profusion.mobi> wrote:
> thanks!
>
> whenever upstream https://github.com/gentoo/eudev/pull/139 is merged
> I'll let you know, but if the patch conflicts then it was already
> applied upstream and you can drop it.
>
> On Fri, Dec 30, 2016 at 7:08 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>>> "Gustavo" == Gustavo Sverzut Barbieri <barbieri@profusion.mobi> writes:
>>
>>  > Add missing defines so eudev builds for older kernels such as 2.6
>>  > Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
>>  > Reviewed-by: Romain Naour <romain.naour@gmail.com>
>>
>> Committed after extending the commit message with details about when
>> these symbols were added and the link to the upstream patch submission,
>> thanks.
>>
>> --
>> Bye, Peter Korsgaard
>
>
>
> --
> Gustavo Sverzut Barbieri
> http://profusion.mobi embedded systems
> --------------------------------------
> MSN, GTalk, FaceTime: barbieri at gmail.com
> Skype: gsbarbieri
> Mobile: +55 (16) 99354-9890



-- 
Gustavo Sverzut Barbieri
http://profusion.mobi embedded systems
--------------------------------------
MSN, GTalk, FaceTime: barbieri at gmail.com
Skype: gsbarbieri
Mobile: +55 (16) 99354-9890
