From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 23:02:47 +0200
Subject: [Buildroot] [PATCH 4/4] ngrep: add license information
In-Reply-To: <CAAXf6LWpHP+6=8-+564hLFuwt9VJKXBJxTa8UV8pKeNHMezFyw@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 14 Oct 2013 21:37:07
 +0200")
References: <1381759541-15243-1-git-send-email-phil@zankapfel.net>
 <1381759541-15243-4-git-send-email-phil@zankapfel.net>
 <CAAXf6LWpHP+6=8-+564hLFuwt9VJKXBJxTa8UV8pKeNHMezFyw@mail.gmail.com>
Message-ID: <87vc0zmuq0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
 >> +NGREP_LICENSE = BSD-Style

 Thomas> Is it possible to map this onto any of the standard abbreviations as
 Thomas> specified here:
 Thomas> http://buildroot.uclibc.org/downloads/manual/manual.html#legal-info-list-licenses

 Thomas> i.e. BSD-2c, BSD-3c, or BSD-4c ?

The closest match is BSD-4c as it contains the dreaded advertising
clause, but it isn't a perfect match:

http://lists.debian.org/debian-legal/2000/11/msg00087.html

Maybe we should use 'BSD-4c-like'?

-- 
Bye, Peter Korsgaard
