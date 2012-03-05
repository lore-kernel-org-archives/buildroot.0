From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Mar 2012 21:14:53 +0100
Subject: [Buildroot] udev buiild error Build complains : tar: invalid
	option -- J
In-Reply-To: <A04BD841D4954F53ADE963E814453ABA@JohanW7> (Sagaert Johan's
 message of "Mon, 5 Mar 2012 17:28:04 +0100")
References: <A04BD841D4954F53ADE963E814453ABA@JohanW7>
Message-ID: <87hay2954y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi

 Sagaert> Have a problem building udev: using 2012.02  kernel 2.6.36 uclibc 0.9.33
 Sagaert> Build complains : tar: invalid option -- J  
 Sagaert> (my host tar version is 1.20)

Yes, Sven Neumann also reported it late last month:

http://lists.busybox.net/pipermail/buildroot/2012-February/050659.html

This was so close to the final 2012.02 that no workaround (besides
updating your tar version) has been made.

-- 
Bye, Peter Korsgaard
