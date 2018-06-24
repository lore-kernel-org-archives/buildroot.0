From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 21:10:23 +0200
Subject: [Buildroot] [PATCH 1/1] collectd: use --disable-werror
In-Reply-To: <20180624154452.31187-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Jun 2018 17:44:52 +0200")
References: <20180624154452.31187-1-fontaine.fabrice@gmail.com>
Message-ID: <87muvkf1b4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since version 5.6.0, --disable-werror is available:
 > https://github.com/collectd/collectd/pull/1222

 > So use this option, instead of adding a hook to remove it from
 > Makefile.in

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
