From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Sep 2010 19:49:13 +0200
Subject: [Buildroot] Where is Bluez in the config?
In-Reply-To: <000901cb6088$65a98ba0$30fca2e0$@com>
References: <mailman.982.1284576537.2900.buildroot@busybox.net>
	<000901cb6088$65a98ba0$30fca2e0$@com>
Message-ID: <20100930194913.435607cf@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Barry,

On Thu, 30 Sep 2010 11:15:24 +0100
"Barry Bridges" <barry@disignconsultants.com> wrote:

> I have a need to include Bluez into my build and have noticed it
> nemtioned in the mailing list, but can't find it anywhere in the
> config to build it in. What am I missing? Does it need patching into
> buildroot?

Bluez is not yet included in Buildroot. However, someone has recently
contributed a patch that you can find at
http://lists.busybox.net/pipermail/buildroot/2010-September/037749.html.

We didn't had the time to review and merge this patch yet, but if you
test it, please share your results with us !

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
