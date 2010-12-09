From: Jomas Nash <jomasnash@gmail.com>
Date: Thu, 9 Dec 2010 16:40:21 +0100
Subject: [Buildroot] problem with new package partimage
In-Reply-To: <AANLkTimc0c=FW=2Zv4jT9WWV7bc903J2VkOoZ0L9a+Af@mail.gmail.com>
References: <AANLkTimc0c=FW=2Zv4jT9WWV7bc903J2VkOoZ0L9a+Af@mail.gmail.com>
Message-ID: <AANLkTinScnan+v3ys81p40EohreZpLYY3CrWkzxPWHy8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

I found another strange thing with partimage.
When I start partimage and run 'ps'  in an other terminal, I see that 3
instances of partimage are running.
like:


1117   partimage -S  etc...
1118   partimage -S
1119   partimage -S

All three lines have the same parameters
At my "normal" linux system (ubuntu) there is only one instance of partimage
when I start it


Has anybody an idea what can cause this?
It looks like partimge does not want to be compiled in buildroot.

Kind regards,
Jomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101209/0c0b8e35/attachment.html>
