From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Jan 2013 08:36:14 +0100
Subject: [Buildroot] Build error : *** Recursive variable
	`DIRECTFB_INPUT' references itself
In-Reply-To: <C0BEF04D1B814409ACBF0C6A053DE12A@JohanW7> (Sagaert Johan's
 message of "Mon, 21 Jan 2013 01:29:01 +0100")
References: <C0BEF04D1B814409ACBF0C6A053DE12A@JohanW7>
Message-ID: <87bocjasy9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> The latest git pull is broken by : *** Recursive variable `DIRECTFB_INPUT'
 Sagaert> references itself
 
 Sagaert> snip ...

 Sagaert> I think it has something to do with this commit : Buildroot]
 Sagaert> [PATCH 1/2] packages: remove all := signs

Indeed. I'll fix it up now.

-- 
Bye, Peter Korsgaard
