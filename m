From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Nov 2011 20:45:11 +0100
Subject: [Buildroot] [Bug ] 2011.11rc3 On 64bit Linux Dev Machine armeb
	builds libs to lib64 dir
In-Reply-To: <zarafa.4ed4fc8c.6718.529f03446f9d00b0@jedmail.edag.de> (Peter
 Katzmann's message of "Tue, 29 Nov 2011 16:38:52 +0100")
References: <zarafa.4ed4fc8c.6718.529f03446f9d00b0@jedmail.edag.de>
Message-ID: <8762i2sofs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Katzmann <peter.katzmann@edag.de> writes:

 Peter> Hello,
 Peter> it seems that some configure scripts needs a little help to know where to place the library's.
 Peter> The following small patch fixes the problem for me, but i don't know if it is a good idea for all platforms to insist that the libdir is /usr/lib .
 Peter> peter

What packages were those exactly?

-- 
Bye, Peter Korsgaard
