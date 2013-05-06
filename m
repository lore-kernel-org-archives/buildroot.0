From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 May 2013 09:24:26 +0200
Subject: [Buildroot] [PATCH] automake version update 1.12.4
In-Reply-To: <20130506092138.55d479bb@skate> (Thomas Petazzoni's message of
 "Mon, 6 May 2013 09:21:38 +0200")
References: <1352464469-22784-1-git-send-email-alexander@mezon.ru>
 <51854C29.2050902@zacarias.com.ar> <20130506092138.55d479bb@skate>
Message-ID: <87ip2wlget.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> These packages need to be fixed before (example: neardal), otherwise the
 >> bump would just introduce build errors.

 Thomas> For this kind of fairly sensitive transitions, I think it'd be great to
 Thomas> do a allyespackageconfig build first, discard all the failing packages
 Thomas> (they are not too many packages failing at this point), and redo the
 Thomas> same experience with automake bumped. So we have a list of which
 Thomas> packages have to be fixed, and progressively go through each of them.

Indeed. Don't forget to first configure a "full" toolchain (C++,
largefile, wchar, locale) so all packages are visible.

-- 
Bye, Peter Korsgaard
