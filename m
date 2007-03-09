From: Alex Ugarte <augarte@vicomtech.es>
Date: Fri, 09 Mar 2007 10:24:08 +0100
Subject: [Buildroot] [buildroot] mkisofs patch
Message-ID: <op.tow0einbfolmf1@inv17.vicomtech.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have been testing buildroot for a couple of weeks, and at the beginning  
i could build an iso9660 image with no problems. But two days ago i  
cleaned all generated directories and I got an error that mkisofs did not  
exist.

I don't know why it worked the first time or why it didn't the second one,  
but after copying this patch  
(http://lfs.securewebservices.co.uk/patches/downloads/cdrtools/cdrtools-2.01-kernel_2.6-3.patch  
) into target/iso9660 it worked again. It's not necessary to modify the  
iso9660.mk file, as it already contains a instruction to apply every patch  
present on the target/iso9660 directory.

cheers,

Alex

-- 

?lex Ugarte I?iguez de Heredia
Investigador / Researcher

VICOMTech - Visual Interaction and Communication Technologies Center
Mikeletegi Pasealekua, 57 - Parque Tecnol?gico
E-20009 Donostia - San Sebasti?n, Spain
Tel: +[34] 943 30 92 30
Fax: +[34] 943 30 93 93
e-mail: augarte at vicomtech.es
http://www.vicomtech.es

*** member of INI-GraphicsNet ****
http://www.inigraphics.net
*** member of IK4 Research Alliance ****
http://www.ik4.es

-----------------------------------------------------
VICOMTech is an ISO 9001:2000 certified institute
-----------------------------------------------------
