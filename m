From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 11:37:14 +0100
Subject: [Buildroot] [PATCH 4/7] package/civetweb: fix build error on a
	host with make v4.0
In-Reply-To: <CAHkwnC_Qnxfj=bNw4++ytgX0eLa_w6+yggY1qMvyLp5TgcV-Og@mail.gmail.com>
 (Fabio Porcedda's message of "Sat, 28 Feb 2015 10:47:12 +0100")
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
 <1425028764-1146-5-git-send-email-fabio.porcedda@gmail.com>
 <87egpaz9rx.fsf@dell.be.48ers.dk>
 <CAHkwnC_Qnxfj=bNw4++ytgX0eLa_w6+yggY1qMvyLp5TgcV-Og@mail.gmail.com>
Message-ID: <871tlaz5id.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

Hi,

>> Committed, thanks.
 >> 
 >> Strangely enough, make on my system (Debian 4.0-8.1) only warns about
 >> the syntax:
 >> 
 >> Makefile:203: *** mixed implicit and normal rules: deprecated syntax

 > That is because in the debian package the have backported a change to
 > turn it in a worning:
 > http://metadata.ftp-master.debian.org/changelogs//main/m/make-dfsg/make-dfsg_4.0-8.1_changelog
 > make-dfsg (4.0-2) experimental; urgency=medium

 >   * Pull back some patches from upstream git that fix bugs. One of these
 >     converts the mixed implicit and explicit rule error into a warning,
 >     and that should give us a grace period to fix the Makefiles,

 > The make on fedora 21 does not have such a patch so it fails like the
 > officiale make 4.0 release.

Ok, thanks!

-- 
Bye, Peter Korsgaard 
