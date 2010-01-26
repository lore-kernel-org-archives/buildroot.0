From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Jan 2010 16:19:19 +0100
Subject: [Buildroot] [PATCH] SDL needs tslib to be compiled first when
	selected.
In-Reply-To: <4B5EEBDA.70901@free.fr> (Julien Boibessot's message of "Tue, 26
	Jan 2010 14:19:22 +0100")
References: <1264507483-25049-1-git-send-email-julien.boibessot@free.fr>
	<87eildqcty.fsf@macbook.be.48ers.dk> <4B5EEBDA.70901@free.fr>
Message-ID: <87sk9sq4g8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:

Hi,

 Julien> Should I also add a "--enable-tslib=no" configure option (not
 Julien> tested) to SDL, when tslib is not selected in BR ?  (like for
 Julien> directfb or x11)

Only if configure does the wrong thing (E.G. detects tslib being
installed on the host when you do a target == host build).

-- 
Bye, Peter Korsgaard
