From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Fri, 16 Oct 2009 13:50:19 +0200
Subject: [Buildroot] EFL in buildroot
Message-ID: <1255693819.28018.17.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here is a bunch of patches to include EFL in buildroot.
I tested it with DirectFB only. If someone could test it with x11 that
would be great.

It seems Ecore has some problem to disable the X backend. I tried to
report the bug on the enlightenment's trac but I didn't find a way to
create an account :/ ... The problem seems to be in the configure
script, I will try to fix that later.

Regards,

-- 
Lionel Landwerlin <lionel.landwerlin@openwide.fr>
