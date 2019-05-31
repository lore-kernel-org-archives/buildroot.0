From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 01 Jun 2019 00:27:37 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] package/wireshark: security bump to version 3.0.2
In-Reply-To: <20190529213530.20748-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 29 May 2019 23:35:30 +0200")
References: <20190529213530.20748-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvdauuna.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The following vulnerabilities have been fixed:
 >  - wnpa-sec-2019-19 Wireshark dissection engine crash. Bug 15778.

 > Update patches to use the ones merged upstream

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v2 -> v3:
 >  - Use patch from upstream instead of updating current patches

 > Changes v1 -> v2:
 >  - Fix static linking with glib2

Committed, thanks.

-- 
Bye, Peter Korsgaard
