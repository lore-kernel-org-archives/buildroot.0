From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 18 Feb 2013 15:49:16 +0200
Subject: [Buildroot] multchoice menu with kconfig
Message-ID: <5122315C.3070806@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all

Could someone show me how to make a multi-choice menu with kconfig
language with the ability to select
several menu entries and then storing those values as a space separated
string variable.

Let's say I have the following locales:

af
ak
ar
as
ast
etc .... bazillion other locale values

and I would like to be able to select as many of those locales I want.
Let's say I select locales "ak" and "ast" and then store them in a
variable like BR2_PACKAGE_FOO_LOCALES so that it would look like

BR2_PACKAGE_FOO_LOCALES = "ak ast"

how to do that in the least amount of typing ?

Regards
Stefan
