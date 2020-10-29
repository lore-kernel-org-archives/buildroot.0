From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 17:39:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/libraw: security bump to
 version 0.20.2
In-Reply-To: <20201019213427.790231-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 19 Oct 2020 23:34:27 +0200")
References: <20201019213427.790231-1-fontaine.fabrice@gmail.com>
Message-ID: <87a6w5gf62.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-24890: libraw 20.0 has a null pointer dereference
 > vulnerability in parse_tiff_ifd in src/metadata/tiff.cpp, which may
 > result in context-dependent arbitrary code execution.

 > https://www.libraw.org/news/libraw-0-20-2-Release

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
