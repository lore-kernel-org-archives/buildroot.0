From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 16 Apr 2010 16:49:50 +0000 (UTC)
Subject: [Buildroot] Where does 'BOARD_NAME' Makefile.in variable come
	from?
References: <hqa2ka$uek$1@dough.gmane.org> <4BC89084.1090404@gogo-robot.com>
Message-ID: <hqa4fe$7bh$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-04-16, Andrew Porritt <aporritt@gogo-robot.com> wrote:
> I think you pass it in on the command line. E.g.:
>
> make BOARD_NAME=at91sam9261ek

I've never done that, and I can't find it mentioned in any of the docs
(either from buildroot or from Atmel).

I think it might be something Atmel-specific...

-- 
Grant Edwards               grant.b.edwards        Yow! Did I say I was
                                  at               a sardine?  Or a bus???
                              gmail.com            
