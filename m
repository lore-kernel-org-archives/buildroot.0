From: Brian Beattie <beattie@beattie-home.net>
Date: Fri, 01 Aug 2008 21:34:36 -0700
Subject: [Buildroot] Why linux26-modules before linux26
Message-ID: <1217651676.6280.11.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a kernel that does not want to compile the modules before the
rest of the kernel.  I've worked around that, but it does raise a
question that maybe somebody knows the answer to, why are the makefiles
set  to compile the kernel-modules so early compared to the rest of the
kernel?
-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto
