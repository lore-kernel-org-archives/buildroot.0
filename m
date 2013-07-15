From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Jul 2013 23:21:32 +0200
Subject: [Buildroot] [PATCH v5 3/3] qt: add powervr and opengl
In-Reply-To: <1373639678-7357-3-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Fri, 12 Jul 2013 09:34:38 -0500")
References: <1373639678-7357-1-git-send-email-spenser@gillilanding.com>
 <1373639678-7357-3-git-send-email-spenser@gillilanding.com>
Message-ID: <87zjtn8qoz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> Use the following to test:
 Spenser> /usr/share/qt/examples/opengl/hellogl_es2/hellogl_es2 -qws -display powervr

Small issue that I just noticed:

 Spenser> +++ b/package/qt/qt-eglwsegl-use-system.patch
 Spenser> @@ -0,0 +1,802 @@
 Spenser> +Patch to remove obslete powervr headers and instead use the headers provided

s/obslete/obsolete/

Otherwise it looks good.

-- 
Bye, Peter Korsgaard
