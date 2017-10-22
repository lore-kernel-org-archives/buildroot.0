From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Oct 2017 15:10:19 +0200
Subject: [Buildroot] [PATCH 2017.02.x] xen: add upstream post-4.7.3
	security fix for XSA-245
In-Reply-To: <20171021162437.9490-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 21 Oct 2017 18:24:37 +0200")
References: <20171021162437.9490-1-peter@korsgaard.com>
Message-ID: <878tg3ba6c.fsf@dell.be.48ers.dk>
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

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
