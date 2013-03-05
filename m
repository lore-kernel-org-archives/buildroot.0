From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Mar 2013 19:47:07 +0100
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <1362500477.20183.74.camel@genx>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
Message-ID: <20130305194707.474ded42@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Tue, 05 Mar 2013 08:21:17 -0800, John Stile wrote:

> Does this look like a good make file for buildroot?  

Unfortunately no, it is not a good makefile. It uses a way of writing
packages that is deprecated since multiple years. Please use the
generic-package or autotools-package infrastructure. Refer to the
Buildroot manual at
http://buildroot.org/downloads/manual/manual.html#adding-packages.

> Is this the right place to get advice on a make file, or even submit?

It is a good place.

> I put this together from various sources/references.

Could you list which sources/references you've found, so that we can
kill them, and make those incorrect informations disappear?

The authoritative source of documentation for Buildroot is the
Buildroot documentation itself.

Raah, Google is great... but nowadays people use Google first and find
some random information, rather than first look at the project's
documentation. I don't blame you: I do the same in many cases :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
