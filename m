From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:27:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: fix CVE-2019-14834
In-Reply-To: <20200229133437.2780453-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 14:34:37 +0100")
References: <20200229133437.2780453-1-fontaine.fabrice@gmail.com>
Message-ID: <8736aavoc4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > A vulnerability was found in dnsmasq before version 2.81, where the
 > memory leak allows remote attackers to cause a denial of service
 > (memory consumption) via vectors involving DHCP response creation.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
