From: Jonathan Boivin <jboivin@progi-media.com>
Date: Mon, 8 Jun 2015 16:39:59 -0400
Subject: [Buildroot] New makedevs.c which can now handle users/groups
	created via FOO_USERS
Message-ID: <CACiQJzwO=snzcFXDJY7-eJ==dd7tcGrkvBahksHTv7UmfO_ZLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi !

This new version is useful when a package create new users via
FOO_USERS and want to use the username newly created into
FOO_PERMISSIONS.

http://pastebin.com/UK5WDm7X

Jonathan Boivin
Ing?nieur logiciel jr.  ? Junior software engineer
T?l.: 514.272.0599 poste 1205  |  progi-media.com
