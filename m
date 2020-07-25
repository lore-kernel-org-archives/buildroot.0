From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jul 2020 09:29:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/squid: security bump to version
 4.12
In-Reply-To: <20200723215623.890307-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 23 Jul 2020 23:56:23 +0200")
References: <20200723215623.890307-1-fontaine.fabrice@gmail.com>
 <20200723215623.890307-2-fontaine.fabrice@gmail.com>
Message-ID: <87r1t0yrv4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-15049: Cache Poisoning Issue in HTTP Request processing
 > - Fix CVE-2020-14058: Denial of Service issue in TLS handshake
 > - Fix CVE-2020-14059: Denial of Service when using SMP cache

 > This version also fix a build failure with systemd

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4f586c497577d6c96289e821430fa2c2f61eda2a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
