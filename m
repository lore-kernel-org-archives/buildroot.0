From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jul 2012 12:30:39 +0200
Subject: [Buildroot] [PATCH] less: build after busybox
In-Reply-To: <50126CD8.7010201@zacarias.com.ar>
References: <1343330317-24730-1-git-send-email-gustavo@zacarias.com.ar>
 <CAHXCMM+ORAKWNqQJ34FEZ+AbQ5dfpVuZAF3Y85xz6Wf9pmccmg@mail.gmail.com>
 <50124E38.6040504@mind.be> <50126CD8.7010201@zacarias.com.ar>
Message-ID: <20120727123039.14dc6528@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 27 Jul 2012 07:26:32 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> I'm not a big fan of that either, it's not buildroot's resposability
> to do effort deduplication.
> With that reasoning should we disable busybox's httpd if
> lighttpd/hiawatha/boa/some other web server is enabled?
> It's a thin line to walk on, lighttpd > boa so boa should be disabled,
> and things like that...

Yes, that's what I was going to say: the full-featured "less" is an
obvious replacement for Busybox "less", but there are more complicated
cases like httpd as you said.

We definitely don't want to go down that road.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
