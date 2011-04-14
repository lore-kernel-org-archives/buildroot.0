From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 Apr 2011 12:02:53 +0300
Subject: [Buildroot] Switching to /dev/ttyX
In-Reply-To: <BANLkTi=_zF-UOK2PQPxewXb7bPO00mzuAQ@mail.gmail.com>
References: <BANLkTi=_zF-UOK2PQPxewXb7bPO00mzuAQ@mail.gmail.com>
Message-ID: <20110414090253.GC2867@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Apr 14, 2011 at 09:50:17AM +0200, Thomas De Schampheleire wrote:
> My question is: how can I access the other /dev/tty's?
> I tried the chvt command, but that does nothing: the command just
> completes but nothing changes on the shell.
> 
> 'tty' always shows /dev/ttyS0.

You may try conspy, http://www.stuart.id.au/russell/files/conspy/.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
