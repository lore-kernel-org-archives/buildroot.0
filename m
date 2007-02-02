From: Daniel Laird <danieljlaird@hotmail.com>
Date: Fri, 2 Feb 2007 06:41:36 -0800 (PST)
Subject: [Buildroot] Configuring for different backends?
Message-ID: <8768090.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I am looking at using buildroot to compile me a GTK running on DirectFB
This has various dependencies like
Cairo,
Pango,
ATK, etc

Some of these packages need to be configured differently depending upon the
backend chosen (X, DirectFB, ...) etc

What do people think is the best way to deal with this?
Is is a package specific config option So for each of these packages specify
a backend option?
Or is it a global switch for all affected packages?

Cheers
Dan
-- 
View this message in context: http://www.nabble.com/Configuring-for-different-backends--tf3161195.html#a8768090
Sent from the BuildRoot mailing list archive at Nabble.com.
