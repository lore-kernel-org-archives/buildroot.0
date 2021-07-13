From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Jul 2021 23:44:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/slirp: security bump to version
 4.6.1
In-Reply-To: <20210701203842.470599-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 1 Jul 2021 22:38:42 +0200")
References: <20210701203842.470599-1-fontaine.fabrice@gmail.com>
Message-ID: <87fswhx526.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > mtod()-related buffer overflows (CVE-2021-3592 #44, CVE-2021-3593 #45,
 > CVE-2021-3594 #47, CVE-2021-3595 #46).

 > Drop patch (already in version)

 > https://gitlab.freedesktop.org/slirp/libslirp/-/blob/v4.6.1/CHANGELOG.md

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
