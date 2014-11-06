From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2014 18:24:13 +0100
Subject: [Buildroot] [PATCH 0/7] [RFC] systemV init without busybox
 series
In-Reply-To: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141106182413.198106d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  6 Nov 2014 10:36:46 -0300, Gustavo Zacarias wrote:

> The series is still missing start-stop-daemon which is contained in the dpkg
> upstream package which begs the question, should we ship it as dpkg (with the
> side consequences and expectations) or name it start-stop-daemon and install
> just that? (option 2 is what i've got done at the moment, that's my choice,
> but be free and vote).

Have you seen "[PATCH] start-stop-daemon: new package" already
submitted by Karoly Kasza a few days ago?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
