From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Dec 2014 00:33:05 +0100
Subject: [Buildroot] [PATCHv3 59/74] transmission: install init script
	unconditionally
In-Reply-To: <87h9xf54u1.fsf@dell.be.48ers.dk>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-60-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141130174628.GO4124@free.fr> <87h9xf54u1.fsf@dell.be.48ers.dk>
Message-ID: <20141201233305.GA22766@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-12-02 00:27 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Thomas, All,
>  > On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
>  >> As discussed, users should use a rootfs overlay or a post-build script
>  >> instead of a custom skeleton to override files installed by Buildroot,
>  >> so there is no point in having conditions when installing init scripts
>  >> or configuration files.
>  >> 
>  >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
>  > Acked-by: ME
> 
> Missing macro expansion? I've fixed that up before committing.

Yup, just press [TAB] for me, will you? Hehe! ;-)

Thank you!

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
