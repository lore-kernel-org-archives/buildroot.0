From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 20 Dec 2012 16:06:42 +0100
Subject: [Buildroot] [PATCH] Makefile: fix cross target
In-Reply-To: <CAEYzJUF7Pe6je0AuVBGTMoFN+GZw=vDz3-T-Sw=BwEOq22GXbQ@mail.gmail.com>
References: <1356012991-32494-1-git-send-email-fabio.porcedda@gmail.com>
 <87pq24yemq.fsf@dell.be.48ers.dk>
 <CAHkwnC-4ewBJ2qgqT3B8S9dRxsL07tuece49xvvGLjgv2fX4EQ@mail.gmail.com>
 <CAEYzJUF7Pe6je0AuVBGTMoFN+GZw=vDz3-T-Sw=BwEOq22GXbQ@mail.gmail.com>
Message-ID: <CAHkwnC-qrYqYa_sEzoS9ea6HEyprN-gdsx_6Q3JKv8g6=+Pjbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 20, 2012 at 3:55 PM, Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
> On 20 December 2012 15:51, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
>> On Thu, Dec 20, 2012 at 3:36 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
>>>
>>> Hi,
>>>
>>>  Fabio> The cross target was laking some dependency.
>>>  Fabio> Now it's possible to successfully use the target right
>>>  Fabio> after the configuration.
>>>
>>> The fix is fine, but what exactly is your use case for using 'make
>>> cross'? It's not documented anywhere, and I was thinking about dropping
>>> it.
>>
>> Sometimes i just want to built/prepare only the toolchain right after
>> using a defconfig or a make clean,
>> to be able to use the toolchain for building specific buildroot
>> packages or compile local source code outside buildroot without build
>> unnecessary stuff like busybox, rootfs, etc...
>>
>> If it's useful i can submit a patch to document it.
>
> Sounds useful to me. But I'd call the target "toolchain" instead of
> "cross". That sounds more like what it does, doesn't it?

"toolchain" sounds better.
If it's ok i will send an updated patch to rename and document it (make help).

Best regards
--
Fabio Porcedda
