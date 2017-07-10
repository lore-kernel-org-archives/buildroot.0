From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Jul 2017 11:26:14 +0000
Subject: [Buildroot] [Bug 10021] New: libqeglfs-viv-integration.so file is
 missing for qt5 on armv7
Message-ID: <bug-10021-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10021

            Bug ID: 10021
           Summary: libqeglfs-viv-integration.so file is missing for qt5
                    on armv7
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tuzakli.refik at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7096
  --> https://bugs.busybox.net/attachment.cgi?id=7096&action=edit
defconfin file

Hi,

I want build linux thats run qt5 and it uses gpu on imx6dl. So it need
libqeglfs-viv-integration.so file at /usr/lib/qt/plugins/egldeviceintegrations
to link gpu driver vivante and eglsfs from qt but it is missing although I
select imx-gpu-viv and eglfs support. build root does not create integration
file.

BR2_PACKAGE_IMX_GPU_VIV [=y]
BR2_PACKAGE_QT5BASE_EGLFS [=y]
BR2_PACKAGE_QT5BASE_OPENGL [=y]

instead there is ligelfs-viv-kms-integration even it does not selected.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
