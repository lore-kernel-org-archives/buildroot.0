From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Mon, 19 May 2014 15:01:06 +0200
Subject: [Buildroot] [Question] How is the kconfig parser working ?
Message-ID: <537A1CB2020000460004FF90@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I'd like to parse some packages in the Buildroot directory and their dependencies. 

I've seen that BR is using the lxdialog. I already got it running to load the "config.in"s with my own frontends. But what I couldn't figure out is how to get the information of a specific package, e.g.: how can I trigger the parser to print all names and dependencies of the packages e.g. in the "audio/video" section? Is it even possible to parse all of the Config.in easily? The "conf_parse()" in zconf.y looks like to me it is parsing the .config and not the Config.in - but maybe I got this part wrong. 

I guess this would lead to a long answer, therefor maybe you can just point me to the right direction, like: where BR itself uses this functionality, an example, or a helpful link in the internet.

Kind Regards

Frank

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140519/c9661d80/attachment.html>
