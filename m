From: Timo Ketola <Timo.Ketola@exertus.fi>
Date: Mon, 23 Sep 2019 19:31:35 +0000
Subject: [Buildroot] [PATCH 1/1] fs/cpio: make initramfs init script
 survive 'console=' kernel argument
In-Reply-To: <87pnjrvt3y.fsf@dell.be.48ers.dk>
References: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi>
 <87tv93w43e.fsf@dell.be.48ers.dk>
 <dde1b129-f7fd-a444-fbd3-f1c017a311fd@exertus.fi>
 <87pnjrvt3y.fsf@dell.be.48ers.dk>
Message-ID: <584b996e-3e09-f4ec-3fea-fd65d7c252bf@exertus.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On 23.9.2019 20.07, Peter Korsgaard wrote:
>>>>>> "Timo" == Timo Ketola <timo@exertus.fi> writes:
>  > But I thought BR does just that here:
> 
>  > https://git.busybox.net/buildroot/tree/fs/cpio/cpio.mk
> 
>  > line 24, 25
> 
> Heh, indeed - I forgot about that logic. Then I guess it is good, unless
> something else in the boot sequence doesn't like a missing
> stdin/stdout/stderr.

I think BusyBox's init takes care about that. See my conversation with
Arnout:

http://lists.busybox.net/pipermail/buildroot/2019-September/259889.html

And thanks for looking at this.

--

Timo
