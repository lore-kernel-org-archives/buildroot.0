From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 03 May 2014 22:54:31 +0200
Subject: [Buildroot]
	=?utf-8?q?=5BPATCH_5/8=5D_mesa3d=3A_Remove_dependency?=
	=?utf-8?q?_for_the_libxml2_module_of_host-python?=
References: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
 <1398968277-9044-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <7l1g3bxsru.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in
news:1398968277-9044-6-git-send-email-bernd.kuhls at t-online.de: 

>  package/mesa3d/mesa3d-0004-no_python_libxml2.patch |  699
>  ++++++++++++++++++++ package/mesa3d/mesa3d.mk                          

Hi,

mesa3d 10.2-rc1 was released today which includes this patch. I already 
created a patch series making the huge patch mentioned above superflous.
Xbmc, currently present in buildroot, and pending Xbmc Gotham release both 
compile against mesa3d 10.2-rc1.

Shall I wait for a 10.2 release or can I post my new patches right away?

Regards, Bernd
