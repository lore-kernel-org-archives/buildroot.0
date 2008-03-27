From: Arndt Kritzner <kritzner@logicway.de>
Date: Thu, 27 Mar 2008 13:16:43 +0100
Subject: [Buildroot] external mkimage needed for uImage generation?
Message-ID: <47EB902B.8040802@logicway.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using the atstk1002_defconfig, kernel image building in uImage
format fails because of a missing mkimage converter (from U-Boot).
(For the moment I "borrowed" a binary mkimage from Atmels files and
installed it to /usr/bin.)
-- 

--
###############################################################
Dipl. Ing Arndt Kritzner    Tel:    (0385) 3993 448
Logic Way GmbH              Fax:    (0385) 3993 458
Hagenower Strasse 73        HTTP:   http://www.logicway.de
19061 Schwerin              email:  mailto:kritzner at logicway.de
###############################################################
