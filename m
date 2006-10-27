From: Michael Opdenacker <michael-lists@free-electrons.com>
Date: Fri, 27 Oct 2006 10:22:08 +0200
Subject: [Buildroot] Error building arm toolchain: undefined reference
 to `raise'
In-Reply-To: <20061026212614.a050f468.philippe.ney@pardes.ws>
References: <1161855909.454083a599a48@edna.homeip.net>
	<20061026212614.a050f468.philippe.ney@pardes.ws>
Message-ID: <4541C1B0.8080408@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe Ney wrote:
> Have a look at the gumstix buildroot (www.gumstix.org) for a patch called
> uClibc-gcc-41-raise-error.patch, I think this will do the trick.
>   
To save time, here's the exact location of this patch:
http://svn.gumstix.com/gumstix-buildroot/trunk/toolchain/uClibc/uClibc-gcc-41-raise-error.patch

Cheers,

    Michael.

-- 
Michael Opdenacker, Free Electrons
Free Embedded Linux Training Materials
on http://free-electrons.com/training
(More than 1000 pages!)
