From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 05 Mar 2014 17:56:17 +0100
Subject: [Buildroot] [PATCH 9/9] exim: add new package
In-Reply-To: <eahbuaxc1k.ln2@ID-313208.user.individual.net>
References: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
 <1314127033-14861-10-git-send-email-luca@lucaceresoli.net>
 <eahbuaxc1k.ln2@ID-313208.user.individual.net>
Message-ID: <53175731.9010201@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Bernd Kuhls wrote:> Luca Ceresoli <luca@lucaceresoli.net> wrote in
 > news:1314127033-14861-10-git-send-email-luca at lucaceresoli.net:
 >
 >> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
 >> new file mode 100644
 >> index 0000000..a12f5a2
 >> --- /dev/null
 >> +++ b/package/exim/exim.mk
 >> @@ -0,0 +1,49 @@
 >> +#############################################################
 >> +#
 >> +# exim
 >> +#
 >> +#############################################################
 >> +
 >> +EXIM_VERSION = 4.76
 >
 > Hi,
 >
 > quoting a mail from Aug 23rd, 2011 ;)
 >
 > Is there still interest in having Exim in buildroot?

I am still actively using exim in my own configs, and with time I
updated to 4.80.1 as well.

So yes, there is interest.

My original patchset aimed at including exim and cyrus-imapd along with
their dependencies, which include cyrus-sasl. However this set of
packages required a lot of patches in order to work properly, and some
of those I made were not of good quality. Exim has no nice build system,
and the Cyrus stuff is even worse AFAIR.

At that time I prarably was the only one here interested in these
packages and there was no (sufficient) review from other developers.

So in the end I just forgot about it and did not try to mainline it
after all.

 >
 > I have package files for my personal needs which deliver Exim 4.80.1 
(, based
 > on the quoted package, update to 4.82 is pending), Dovecot 2.2.12, 
dovecot-
 > pigeonhole 0.4.2, fetchmail 6.3.26 and clamav 0.98.1 which are used on a
 > production system using uClibc/i386 for several months now.

Is your exim implementation changing anything relevant, apart from the
version number?

I'll try to find a little time to resubmit and updated version.
Please send yours, so we can compare them and maybe merge them into a
better one!

-- 
Luca
