From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 00:04:08 +0100
Subject: [Buildroot] [PATCH 1/1] openswan: security bump to version
 2.6.50.1
In-Reply-To: <20181028102235.16817-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 28 Oct 2018 11:22:35 +0100")
References: <20181028102235.16817-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvkkwpef.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fixes CVE-2018-15836 (a Bleichenbacher-style signature forgery which
 >   involves RSA padding attack)
 > - Add hash for license files

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
