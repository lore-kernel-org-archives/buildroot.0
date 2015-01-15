From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Jan 2015 09:21:17 +0200
Subject: [Buildroot] After adding package rt-tests: can't find
 cyclictest executable
In-Reply-To: <ca7acbb6ce3040f48d7183838d9d0dab@exch13-mail05.win.slac.stanford.edu>
References: <ca7acbb6ce3040f48d7183838d9d0dab@exch13-mail05.win.slac.stanford.edu>
Message-ID: <20150115072117.GM2481@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ernest,

On Thu, Jan 15, 2015 at 04:46:15AM +0000, Williams Jr., Ernest L. wrote:
> We are adding the  "rt-tests" package to the build.
> 
> After build is complete, I don't see the cyclictest executable.

The patch at http://patchwork.ozlabs.org/patch/429266/ should fix this issue. 
Thanks for reporting.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
