From: David Picard <davepiq@yahoo.fr>
Date: Wed, 20 Jan 2016 18:44:32 +0100
Subject: [Buildroot] Qwt package dependencies
Message-ID: <569FC780.7050104@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I noticed that the Qwt package (BR2_PACKAGE_QWT) depends on Qt 4.8 
(BR2_PACKAGE_QT). But I have installed and tested Qt 5.5 already, and 
plan to develop Qt5/Qwt apps.

Do I have to install Qt 4 too just to satisfy the dependencies ? Can I 
tweak some file like package/qwt/Config.in ?

Regards,
David.
