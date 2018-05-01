From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 09:33:58 +0200
Subject: [Buildroot] [PATCH 2/2] sdl2_image: security bump to version
 2.0.3
In-Reply-To: <20180430120459.8438-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 30 Apr 2018 14:04:59 +0200")
References: <20180430120459.8438-1-peter@korsgaard.com>
 <20180430120459.8438-2-peter@korsgaard.com>
Message-ID: <87sh7bj0d5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-12122: An exploitable code execution vulnerability exists in the
 > ILBM image rendering functionality of SDL2_image-2.0.2.  A specially crafted
 > ILBM image can cause a heap overflow resulting in code execution.  An
 > attacker can display a specially crafted image to trigger this
 > vulnerability.

 > CVE-2017-14440: An exploitable code execution vulnerability exists in the
 > ILBM image rendering functionality of SDL2_image-2.0.2.  A specially crafted
 > ILBM image can cause a stack overflow resulting in code execution.  An
 > attacker can display a specially crafted image to trigger this
 > vulnerability.

 > CVE-2017-14441: An exploitable code execution vulnerability exists in the
 > ICO image rendering functionality of SDL2_image-2.0.2.  A specially crafted
 > ICO image can cause an integer overflow, cascading to a heap overflow
 > resulting in code execution.  An attacker can display a specially crafted
 > image to trigger this vulnerability.

 > CVE-2017-14442: An exploitable code execution vulnerability exists in the
 > BMP image rendering functionality of SDL2_image-2.0.2.  A specially crafted
 > BMP image can cause a stack overflow resulting in code execution.  An
 > attacker can display a specially crafted image to trigger this
 > vulnerability.

 > CVE-2017-14448: An exploitable code execution vulnerability exists in the
 > XCF image rendering functionality of SDL2_image-2.0.2.  A specially crafted
 > XCF image can cause a heap overflow resulting in code execution.  An
 > attacker can display a specially crafted image to trigger this
 > vulnerability.

 > CVE-2017-14449: A double-Free vulnerability exists in the XCF image
 > rendering functionality of SDL2_image-2.0.2.  A specially crafted XCF image
 > can cause a Double-Free situation to occur.  An attacker can display a
 > specially crafted image to trigger this vulnerability.

 > CVE-2017-14450: A buffer overflow vulnerability exists in the GIF image
 > parsing functionality of SDL2_image-2.0.2.  A specially crafted GIF image
 > can lead to a buffer overflow on a global section.  An attacker can display
 > an image to trigger this vulnerability.

 > For details, see the announcement:

 > https://discourse.libsdl.org/t/sdl-image-2-0-3-released/23958

 > Also add a hash for the license file while we're at it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
