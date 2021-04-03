From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 13:43:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: annotate
 CVE-2021-27803
In-Reply-To: <20210322191316.1171234-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 22 Mar 2021 20:13:16 +0100")
References: <20210322191316.1171234-1-fontaine.fabrice@gmail.com>
Message-ID: <874kgn61bc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add a WPA_SUPPLICANT_IGNORE_CVES entry for CVE-2021-27803 which was
 > fixed by commit 9ada4eb2f1c3d67ee49f6f5466738bcd821fc647

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Ups, I indeed forgot the _IGNORE_CVES entry.

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
