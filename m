From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 May 2016 17:16:36 +0200
Subject: [Buildroot] [PATCH 2/2] connman: remove xtables build fix patch
In-Reply-To: <573DD413.1050603@zacarias.com.ar>
References: <1463664337-881-1-git-send-email-gustavo@zacarias.com.ar>
 <1463664337-881-2-git-send-email-gustavo@zacarias.com.ar>
 <20160519160603.3debab78@free-electrons.com>
 <573DC881.2030409@zacarias.com.ar>
 <20160519161455.2bacf98f@free-electrons.com>
 <573DCB2F.1020200@zacarias.com.ar>
 <20160519165112.6a8799cf@free-electrons.com>
 <573DD413.1050603@zacarias.com.ar>
Message-ID: <20160519171636.71e7164f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 11:56:19 -0300, Gustavo Zacarias wrote:

> The only caveat would be people with toolchain headers 4.5.0 - 4.5.4 or 
> any eventual external toolchain that ships that way (which by definition 
> would be "broken").

Yes, understood. But I believe that's a reasonable trade-off. Building
a toolchain with 4.5 headers (and therefore running 4.5) is really being
bleeding-edge, so it's pretty unlikely to see many users doing that.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
