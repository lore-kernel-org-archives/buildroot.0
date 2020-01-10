From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 14:54:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: replace
 host-intltool by $(TARGET_NLS_DEPENDENCIES)
In-Reply-To: <20200101211448.3162049-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 1 Jan 2020 22:14:48 +0100")
References: <20200101211448.3162049-1-fontaine.fabrice@gmail.com>
Message-ID: <8736cno1r4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > intltool has been replaced by gettext since version 12.99.1 and
 > https://gitlab.freedesktop.org/pulseaudio/pulseaudio/commit/57e3ccaf51f714eec8ca29005c3cc4fde456e84e
 > so replace host-intltool by $(TARGET_NLS_DEPENDENCIES)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
