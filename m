From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jul 2010 17:22:28 +0200
Subject: [Buildroot] Crosstool/Buildroot integration issue
In-Reply-To: <BLU0-SMTP11A24568AF672F1DE458A4E7B30@phx.gbl>
References: <BLU0-SMTP11A24568AF672F1DE458A4E7B30@phx.gbl>
Message-ID: <20100707172228.644262ce@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andy,

On Wed, 7 Jul 2010 16:19:44 +0200
"Andy Gibbs" <andyg1001@hotmail.co.uk> wrote:

> Hi Yann, Thomas
> 
> I know you've been working on improving the integration of crosstool
> and buildroot recently.  Thank you - I really appreciate it,

Thanks, glad to know this feature is useful.

> Crosstool generates character set libraries in the
> 'sys-root/usr/lib/gconv' folder, but these are not being copied
> across into the target folder when all the other libraries are
> copied.  These means that certain applications that rely on these
> libraries don't function correctly.

I definitely haven't looked at this. Can you provide a simple example
of an application where this is causing an issue, that I could use as a
test case ?

> I'm afraid I've not attached it as a proper patch since I'm not at my
> desk currently and can't form an "official" git patch.  However, if
> you wish me to, then let me know and I will be happy to do so.

Sure. However, I first would like to fully understand what is needed
exactly, for which applications, in which cases, etc. As requested
above, a simple test case would be very perfect.

Thank you very much for your feedback on this!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
