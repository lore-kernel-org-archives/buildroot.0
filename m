From: John Stile <john@stilen.com>
Date: Mon, 12 Nov 2012 16:47:29 -0800
Subject: [Buildroot] howto incorporate buildroot into an autobuild
Message-ID: <1352767649.18724.34.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using buildroot for an embedded Arm project.

I was wondering how people using buildroot implement continuous
integration builds?

Do you start from a clean checkout, build the whole tool chain (which
takes a long time), and then build the project specific stuff?

I worry about not starting from a clean checkout, since some options may
change, and the tools won't be rebuilt.

But I also worry people will complain how long the build takes.

Is there a good strategy to balance these concerns?
