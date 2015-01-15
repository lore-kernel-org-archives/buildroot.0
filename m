From: Williams Jr., Ernest L. <ernesto@slac.stanford.edu>
Date: Thu, 15 Jan 2015 07:47:58 +0000
Subject: [Buildroot] After adding package rt-tests: can't find
 cyclictest executable
In-Reply-To: <20150115072117.GM2481@sapphire.tkos.co.il>
References: <ca7acbb6ce3040f48d7183838d9d0dab@exch13-mail05.win.slac.stanford.edu>,
 <20150115072117.GM2481@sapphire.tkos.co.il>
Message-ID: <73e7eeb3c7174c88ae16179bbab26ab2@exch13-mail05.win.slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


________________________________________
From: Baruch Siach [baruch at tkos.co.il]
Sent: Wednesday, January 14, 2015 11:21 PM
To: Williams Jr., Ernest L.
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] After adding package rt-tests: can't find cyclictest executable

Hi Ernest,

On Thu, Jan 15, 2015 at 04:46:15AM +0000, Williams Jr., Ernest L. wrote:
> We are adding the  "rt-tests" package to the build.
>
> After build is complete, I don't see the cyclictest executable.

The patch at http://patchwork.ozlabs.org/patch/429266/ should fix this issue.
Thanks for reporting.

Thank you, it is working now.  :)

Cheers,
Ernesto


baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
