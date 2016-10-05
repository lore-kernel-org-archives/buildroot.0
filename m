From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 05 Oct 2016 20:00:40 +0200
Subject: [Buildroot] [PATCH v2 04/20] python3: make it exclusive from
	python
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8nrfcdx2pk.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 18 Feb 2014 21:39:57 +0100 schrieb Thomas Petazzoni:

> In Buildroot, we do not support installing both Python 2.x and Python
> 3.x on the target.

Hi,

sorry for warming up this old commit but I would like to ask whether it 
is possible at all to allow python2 and python3 together on the target?

The topic was discussed on the python mailinglist (https://
mail.python.org/pipermail/python-list/2011-March/600724.html) and it did 
not mention any problems.

I need python2 for Kodi, afaics[1] there are no current plans to support 
python3.

For a new function[2] I would like to add to my buildroot-based system I 
need python3 on the target as well.

Regards, Bernd

[1] http://forum.kodi.tv/showthread.php?tid=216598
[2] https://github.com/itkach/slob/
