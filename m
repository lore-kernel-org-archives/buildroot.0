From: W.P. <laurentp@wp.pl>
Date: Fri, 08 Feb 2013 04:30:10 +0100
Subject: [Buildroot] simple(?) question about OpenWRT
Message-ID: <51147142.2020703@wp.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,
I am posting here since OpenWRT build system looks buildroot based.

I'd like to know, how to DISABLE (using menus or something similar) ALL 
the *_tables related stuff.
Cause if I disable (now) it, it builds *_tables modules anyway.
And in my application (firmware for MR3220, 4M flash) it is a problem (I 
need BlueZ + Bash there :( ).

This device is NOT intended to work as router, only as AP + WDS. 
(+AnyRemote host + internet radio).

For now I used (discouraged, I know) "hand crafting" .config file,
but this leads to "your config is out of sync" warning...

W.P.
