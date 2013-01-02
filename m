From: Cam Hutchison <camh@xdna.net>
Date: Wed, 02 Jan 2013 03:44:24 -0000
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
References: <cover.1357070939.git.yann.morin.1998@free.fr>
 <cover.1357070939.git.yann.morin.1998@free.fr>
 <0b0fa3ae335483e6402e2c15465cacdb2d51b0d7.1357070939.git.yann.morin.1998@free.fr>
Message-ID: <54d5.50e3ad18.76e0@xionine.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

>+The syntax for adding a user is a space-separated list of fields, one
>+user per-line; the fields are:

per line - no hyphen here.

>+* no field may contain a column (+:+).

Found it - this is the third spelling mistake I referred to earlier.
s/column/colon/
