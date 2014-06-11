From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 11 Jun 2014 11:09:40 +0200
Subject: [Buildroot] [PATCH 1/1] fetchmail: Update project URL after
	shutdown of berlios.de
References: <1402065903-2779-1-git-send-email-bernd.kuhls@t-online.de>
 <20140607122430.25898775@free-electrons.com>
Message-ID: <XnsA3497189B6274berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140607122430.25898775 at free-electrons.com: 
>> -       http://sourceforge.net/projects/fetchmail/
>> +       http://www.fetchmail.info/
> 
> How is moving from SourceForge to some other place related to the
> shutdown of berlios.de?

Hi,

originally the project was hosted on berlios.de. Due to its closure I 
mentioned sf.net as project page for the time being until the fetchmail 
project moved its official site[1] to a new location. This happened 
meanwhile, therefore the patch ;)

traceroute www.fetchmail.info
[...]
10  vhost.sourceforge.net (216.34.181.97)

Regards, Bernd

[1] http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/79738/focus=79748
