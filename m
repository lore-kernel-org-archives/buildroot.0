From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Fri, 29 Oct 2010 11:51:55 +0200
Subject: [Buildroot] Dockstar (kirkwood derivative) support for buildroot
Message-ID: <4CCA993B.6040309@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mailinglist,

I often worked after closing time to bring dockstar support into 
buildroot. I have a lot of images which boot smoothly and mount over 
nfs. If anyone is interested, I like to share my work with other 
dockstar owners:
http://gitorious.org/dockstar (repo: mynas)

The patchset is not very well documented/quick and dirty, but should 
work with some manual work steps.
Most of the special board configuration is outside the buildroot tree. 
Only one target/device/ file is patched.

Unfortunatly I got stuck at the point, where I had to configure all 
packages on my own. The "distributional" work is too much to overcome in 
rational time (after closing time) for one person. I gave one of the 
Buildroot "children?" or "cousins?" a try: OpenWRT. The packages are 
already configured to meet each other. I think buildroot is more 
interesting for very specialized tasks due to its generic principle. You 
can bloat it up to meet any of your requirements, but this costs time. 
In other projects, you have to follow their design, which may not work 
with your needs...

Anyway, if someone likes to try out the combination dockstar+buildroot, 
the gitorious repo above would be a good starting point.

Kind regards,
Ossy
