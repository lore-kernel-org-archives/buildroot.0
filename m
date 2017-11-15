From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Nov 2017 19:52:46 +0100
Subject: [Buildroot] [PATCH] sdl2: security bump to version 2.0.7
In-Reply-To: <20171026121843.24668-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 26 Oct 2017 14:18:43 +0200")
References: <20171026121843.24668-1-peter@korsgaard.com>
Message-ID: <87fu9fl6gx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-2888 - An exploitable integer overflow vulnerability exists
 > when creating a new RGB Surface in SDL 2.0.5.  A specially crafted file can
 > cause an integer overflow resulting in too little memory being allocated
 > which can lead to a buffer overflow and potential code execution.  An
 > attacker can provide a specially crafted image file to trigger this
 > vulnerability.

 > Also add a hash for the license file while we're at it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
