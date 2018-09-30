From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 20:17:31 +0200
Subject: [Buildroot] [PATCH v2,1/1] bootutils: drop package
In-Reply-To: <20180930140206.13590-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 30 Sep 2018 16:02:06 +0200")
References: <20180930140206.13590-1-fontaine.fabrice@gmail.com>
Message-ID: <87r2ha26kk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > As suggested by Romain Naour during review of patch 976582
 > (https://patchwork.ozlabs.org/patch/976582), drop bootutils as "upstream
 > is dead since 2009" and "BootUtils is a collection of utilities to
 > facilitate booting of modern Kernel 2.6 based systems"

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Romain Naour):
 >  - Add an entry in Config.in.legacy

Committed, thanks.

-- 
Bye, Peter Korsgaard
