From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Apr 2011 17:20:53 +0200
Subject: [Buildroot] [PATCH 1/2] qt: fix plugin installation and change
 plugin path
In-Reply-To: <87vcywz8eq.fsf@macbook.be.48ers.dk>
References: <cover.1301763163.git.thomas.petazzoni@free-electrons.com>
	<cover.1301763163.git.thomas.petazzoni@free-electrons.com>
	<5dc3f963b1e5b12f9a5bb7bf4972619bce18371e.1301763163.git.thomas.petazzoni@free-electrons.com>
	<87vcywz8eq.fsf@macbook.be.48ers.dk>
Message-ID: <20110403172053.63bbf024@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 02 Apr 2011 22:48:45 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> Signed-off-by: Thomas Petazzoni
>  Thomas> <thomas.petazzoni@free-electrons.com> ---
>  Thomas>  package/qt/qt-4.7.2-configure.patch |   48
>  Thomas> +++++++++++++++++++++++++++++++++++
>  Thomas> package/qt/qt.mk                    |   13 +++------ 2 files
>  Thomas> changed, 52 insertions(+), 9 deletions(-) create mode 100644
>  Thomas> package/qt/qt-4.7.2-configure.patch
> 
>  Thomas> diff --git a/package/qt/qt-4.7.2-configure.patch
>  Thomas> b/package/qt/qt-4.7.2-configure.patch new file mode 100644
>  Thomas> index 0000000..cef53e3
>  Thomas> --- /dev/null
>  Thomas> +++ b/package/qt/qt-4.7.2-configure.patch
>  Thomas> @@ -0,0 +1,48 @@
>  Thomas> +Fix -hostprefix behaviour
> 
> Have you sent this patch upstream?

No, I haven't. I could push this to their bugtracker.

> Doesn't this break if there aren't any plugins? E.G. perhaps with a
> static qt build?

Fixed in the updated version I've just sent.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
