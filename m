From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 01 Nov 2014 10:29:54 +0100
Subject: [Buildroot] [git commit] avahi: fix avahi-ui build with libgtk3
In-Reply-To: <1414799165.15213.1.camel@posteo.de> (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sat, 01 Nov 2014 00:46:05 +0100")
References: <20141031115353.56D52B23C4@busybox.osuosl.org>
 <1414799165.15213.1.camel@posteo.de>
Message-ID: <87tx2j5kvh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

Hi,

 >> @@ -16,6 +16,7 @@ AVAHI_SITE = http://www.avahi.org/download
 >> AVAHI_LICENSE = LGPLv2.1+
 >> AVAHI_LICENSE_FILES = LICENSE
 >> AVAHI_INSTALL_STAGING = YES
 >> +AVAHI_AUTORECONF = YES
 >> 

 > This patch breaks building avahi for me. Is autoreconf really intended?
 > Removing it fixed my build.

Yes, the patch modifies Makefile.am, so autoreconf must be done. Odd, it built
here without problems.

I'll take a closer look.

-- 
Venlig hilsen,
Peter Korsgaard 
