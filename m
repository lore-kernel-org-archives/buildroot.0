From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Feb 2021 08:39:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xrandr: add CPE
 variables
In-Reply-To: <20210207134117.2943331-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 7 Feb 2021 14:41:17 +0100")
References: <20210207134117.2943331-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9b3t3e0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:x.org:libxrandr is a valid CPE identifier for this package:
 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax.org%3Alibxrandr

Hmm, are you sure? I would think that this is for our xlib_libXrandr?

-- 
Bye, Peter Korsgaard
