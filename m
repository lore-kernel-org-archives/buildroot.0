From: =?iso-8859-1?Q?C=E9dric?= HEYMAN <c.heyman@til-technologies.fr>
Date: Wed, 11 Feb 2015 16:48:20 +0100
Subject: [Buildroot] Need clarification about glib and dbus
Message-ID: <WC20150211154820.183108@til-technologies.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I intend to use dbus and its C binding Glib on custom distribution built 
with buildroot 2014.11 for sama5d3 target.

When I take a look at 
http://www.freedesktop.org/wiki/Software/DBusBindings/, I see that DBus-GLib 
(obsolete) must not be used. It is recommended to use GDBus instead which is 
the support of DBus in GLib since version 2.26 of GLib.

If I compare with package available in buildroot-2014.11, I read 
"DBUS_GLIB_VERSION = 0.102" in dbus-glib/dbus-glib.mk. 

I feel confused : 
 - Does buildroot compiles dbus-glib (which is indicated deprecated on 
freedesktop.org) ? what does 0.102 version correspond ?
 - Does buildroot compiles glib upper than 2.26 which supports gdbus ?

Regards,
  	
C?dric HEYMAN
Ing?nieur en D?veloppement embarqu?
T?l : 04.42.37.17.10| Fax : 04.42.24.28.98
Si?ge social : 350 rue de la Lauzi?re - Parc du Golf B?t 43 - CS 60481 - 
13592 AIX-EN-PROVENCE CEDEX 3


<font face="Tahoma" size="1" color="#575F5E">
<a href="http://www.til-technologies.fr/bandeau_signature/redirection.html" target="_blank">
<img src="http://www.til-technologies.fr/bandeau_signature/bandeau.jpg" width="600" height="80" border="0" alt="Plus d'actualit?s sur www.til-technologies.fr" />
</a>
<br>
Les informations pr?c?dentes peuvent ?tre confidentielles ou privil?gi?es. Si vous n'?tes pas le destinataire pr?vu de ce mail, veuillez en notifier l'exp?diteur en r?pondant ? ce message puis supprimez-en toute trace de vos syst?mes.
</font>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150211/d9c1b943/attachment.html>
