From: sambuff <samuel.buffet@gmail.com>
Date: Mon, 20 Jan 2014 23:41:17 -0800 (PST)
Subject: [Buildroot] python Gobject
In-Reply-To: <20140117154452.GC10730@pc-eric>
References: <CAAs3wMgAbEnReJ-XW_QnQ=kAU6G7cwzss7yUMytcmHMRYMsjnw@mail.gmail.com>
 <20140117113153.GB10730@pc-eric>
 <CAAs3wMh5xwOK_bEDVM1JMJvw6vYYL2frZYxTc_4ehyLK2sj++g@mail.gmail.com>
 <20140117154452.GC10730@pc-eric>
Message-ID: <1390290077263-60414.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

> Adding a new package for python-gobject 2.28 is pretty straightforward. I
>did it in my repo:
https://github.com/elebihan/buildroot/commit/4107b0e4549aa4a234496c840361528381f57edf.

Thanks for the link but I've failed to build it though.

I've tried your new package with br-2013.11but the build fails because of
"missing python headers"

see the last lines :
"checking for python version... 2.7
checking for python platform... linux2
checking for python script directory...
${prefix}/lib/python2.7/site-packages
checking for python extension module directory...
${exec_prefix}/lib/python2.7/site-packages
checking for python version... (cached) 2.7
checking for python platform... (cached) linux2
checking for python script directory... (cached)
${prefix}/lib/python2.7/site-packages
checking for python extension module directory... (cached)
${exec_prefix}/lib/python2.7/site-packages
checking for headers required to compile python extensions... not found
configure: error: could not find Python headers
make: ***
[/home/xxxxx/buildroot-2013.11/output/build/python-gobject-2.28.6/.stamp_configured]
Error 1"

I consider myself as "learning" how to use buildroot at the moment so I'm
may doing a mistake (but don't know where). If you had any advise that would
make my day.

Thanks for the good job.
Sam 



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/python-Gobject-tp60199p60414.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
