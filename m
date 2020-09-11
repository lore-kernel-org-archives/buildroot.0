From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 22:23:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix CallStranger
 a.k.a. CVE-2020-12675
In-Reply-To: <20200906100938.2687269-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 6 Sep 2020 12:09:38 +0200")
References: <20200906100938.2687269-1-fontaine.fabrice@gmail.com>
Message-ID: <87k0x0xdtz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > No MINIDLNA_IGNORE_CVES entry is added as no CVE has been assigned to
 > minidlna. Indeed, CallStranger vulnerability affect(ed) most of the UPnP
 > stacks (e.g. gupnp, libupnp)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
