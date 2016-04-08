From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Apr 2016 22:11:38 +0200
Subject: [Buildroot] [PATCH] weston: check for both EGL and GLES
In-Reply-To: <1460122957-3164-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 8 Apr 2016 10:42:37 -0300")
References: <1460122957-3164-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wpo7oo79.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The conditional is wrong, it was check for BR2_PACKAGE_MESA3D_OPENGL_ES
 > (correct, means GLESv2 support) and BR2_PACKAGE_MESA3D_OPENGL_GLES
 > (incorrect, there's no such symbol).
 > So now check for BR2_PACKAGE_MESA3D_OPENGL_EGL (EGL support) plus
 > BR2_PACKAGE_MESA3D_OPENGL_ES (GLESv2 support), both are required.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
