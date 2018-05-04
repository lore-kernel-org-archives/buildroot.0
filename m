From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 5 May 2018 00:12:55 +0200
Subject: [Buildroot] Mainline DT-Overlays
Message-ID: <b557edfc-c4b5-e1f6-85ac-369d9fbf28b7@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

would it be useful to add a package to compile dt-overlays with new syntax?
I've gone mad to do it by myself.

I thought about a package that simply accept the base .dts file
and a list of .dtso files, then it compiles them with "-@" option and 
installs them(I don't know where at the moment).

I pushed something here based on a Makefile, but it gives the idea:
https://github.com/micronovasrl/linova-dtoverlays

Best regards

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
