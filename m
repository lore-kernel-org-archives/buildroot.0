From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Feb 2012 22:22:22 +0100
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <CB597E68.2F40%donald.poole@swri.org> (Donald R. Poole's message
 of "Thu, 9 Feb 2012 19:56:56 +0000")
References: <CB597E68.2F40%donald.poole@swri.org>
Message-ID: <878vkb4s8h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:

Hi,

 Donald> So, I see it in the fakroot invocation and when I issue the command you
 Donald> gave to check the permissions of the busybox binary, it get this output:

 Donald> 	-rwsr-xr-x root/root    621852 2012-02-09 13:43 ./bin/busybox

 Donald> So, it appears that it's being set correctly too.

All good. So where does it get stripped from here on until you execute
it on the target?

-- 
Bye, Peter Korsgaard
