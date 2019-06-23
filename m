From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 22:06:42 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/samba4: drop third patch
In-Reply-To: <20190610085656.22736-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 10 Jun 2019 10:56:56 +0200")
References: <20190610085656.22736-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9wwcbhp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop third patch which is not upstreamable and set XSLTPROC to false
 > instead to disable documentation

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Arnout Vandecappelle):
 >  - Use false instead of False

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
