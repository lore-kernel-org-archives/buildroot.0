From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Fri, 30 Dec 2016 12:56:13 -0200
Subject: [Buildroot] [PATCH] eudev: build with older kernels.
In-Reply-To: <CAPdpN3DNDbmKk2JA98PK42eQ24wxHZgsmkK_NoG=JjsXSYxSWg@mail.gmail.com>
References: <20161229144649.29850-1-barbieri@profusion.mobi>
 <53d19a79-a06e-df52-ae4f-1bc0decb7e0c@gmail.com>
 <CAPdpN3Bvppz53OvvXygtLC=4amXL7V54WqO0QjCZgbtCj-pa=A@mail.gmail.com>
 <d63de13a-18e1-1f5a-4dba-33e55d879ef3@gmail.com>
 <CAPdpN3DNDbmKk2JA98PK42eQ24wxHZgsmkK_NoG=JjsXSYxSWg@mail.gmail.com>
Message-ID: <CAPdpN3AqMidYkSkAdjUygBzkXfVMELex3wjtsgyxqwiQdrr3zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

they suggested to add to src/shared/missing.h, that I did and indeed
looks better.

I'll send a new patch with that as well.

On Fri, Dec 30, 2016 at 11:34 AM, Gustavo Sverzut Barbieri
<barbieri@profusion.mobi> wrote:
> On Thu, Dec 29, 2016 at 2:04 PM, Romain Naour <romain.naour@gmail.com> wrote:
>> Le 29/12/2016 ? 17:01, Gustavo Sverzut Barbieri a ?crit :
>>> On Thu, Dec 29, 2016 at 1:51 PM, Romain Naour <romain.naour@gmail.com> wrote:
>>>> Hi Gustavo,
>>>>
>>>> Le 29/12/2016 ? 15:46, Gustavo Sverzut Barbieri a ?crit :
>>>>> Add missing defines so eudev builds for older kernels such as 2.6
>>>>
>>>> Can you summit this patch to eudev upstream ?
>>>
>>> I will try, but not sure they bother with ancient 2.6 kernels like the
>>> one I need :-D
>>
>> Well, if it's just two defines...
>
> done https://github.com/gentoo/eudev/pull/139
>
> if you want to track
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
