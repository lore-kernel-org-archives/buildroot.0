From: Sven Neumann <neumann@teufel.de>
Date: Tue, 29 Oct 2013 10:24:50 +0100
Subject: [Buildroot] Samba 4.1 in buildroot
Message-ID: <1383038690.12630.7.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the recently released version 4.1 of the Samba suite finally supports
the SMB2 und SMB3 protocols on the server and client side. This is a
feature that we are in desperate need of and thus I would like to get
Samba 4 into buildroot.

So my questions are:

(1) Is anyone already working on this?

(2) Would you prefer if the samba package was just ported to the latest
    stable samba 4 version or would you prefer if a new package called
    samba4 was added? In case that you prefer the latter, should the
    existing samba package be renamed to samba3?


Regards,
Sven

-- 
Sven Neumann
Senior System Architect

Lautsprecher Teufel GmbH
Gewerbehof B?lowbogen - Aufgang D1
B?lowstr. 66 - 10783 Berlin - Germany

Registernummer HRB 20271 beim Amtsgericht Berlin-Charlottenburg
Gesch?ftsf?hrer: Edgar van Velzen

Tel. +49 (0)30 - 300 930 - 0, Direkt -153
neumann at teufel.de  

www.teufel.de  www.teufelaudio.com  http://blog.teufel.de
