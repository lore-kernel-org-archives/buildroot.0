From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Oct 2017 00:49:54 +0200
Subject: [Buildroot] [PATCH] xen: add upstream post-4.9.0 security fix
	for XSA-245
In-Reply-To: <20171021180407.10320-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 21 Oct 2017 20:04:07 +0200")
References: <20171021180407.10320-1-peter@korsgaard.com>
Message-ID: <878tg294rx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes XA-245: ARM: Some memory not scrubbed at boot
 > https://xenbits.xenproject.org/xsa/advisory-245.html

 > Notice: Not applying XSA-237..244 as they are x86 only and have patch file
 > name conflicts between 2017.02.x and master.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
