From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:56:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: security bump to
 version 1.8.6
In-Reply-To: <20200229181008.3338093-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 19:10:08 +0100")
References: <20200229181008.3338093-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9n6stvg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2019-15682: RDesktop version 1.8.4 contains multiple
 >   out-of-bound access read vulnerabilities in its code, which results in
 >   a denial of service (DoS) condition. This attack appear to be
 >   exploitable via network connectivity. These issues have been fixed in
 >   version 1.8.5
 > - Update indentation of hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
