From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 26 Mar 2010 11:33:29 -0300
Subject: [Buildroot] [PATCH] New package menu structure
Message-ID: <4BACC5B9.2000403@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Attached is a reorganizacion of the package menu structure.
This is just preliminary work i've done so input is more than welcome.

DONE:

* Moved as many options as possible into categories instead of main.
* Where it's justified opened up categories into subcategories (example:
libraries).
* Moved category directory menus up (games, java, database) - still need
app/dir moves, once the new menu is in. There's no need for a "database"
directory for just a couple of packages for instance.

TODO:

* Work on audio/video items, didn't look into them.
* Work on graphic libs/apps, same deal.
* Check for package-category inconsistencies.
* Audit packages to show up when toolchain dependencies are not met "XX
needs YY".
* Audit packages to select package/library dependencies instead of just
hiding when they're not met.

Please test and throw me some feedback on the mailing list.
Regards.

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-new-package-menu.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100326/425c4865/attachment-0001.diff>
