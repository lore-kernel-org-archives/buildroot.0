From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2011 18:07:43 +0100
Subject: [Buildroot] inittab for Busybox
In-Reply-To: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
Message-ID: <20110315180743.5e34890b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Mar 2011 12:37:01 -0400
"Heyendal, Carl" <CHeyendal@stanleyworks.com> wrote:

> I have not enabled support for sysvinit in my project. Could someone
> tell me why Buildroot adds an inittab file that's incompatible with
> BusyBox? I looked at the mail archives but no one seems to have asked
> that question before.

How do you see that the inittab is incompatible with Busybox ? Many of
us use it every day without problem.

When sysvinit is not selected, fs/skeleton/etc/inittab is the inittab
that is used, and it is compatible with Busybox init.

When sysvinit is selected, package/sysvinit/inittab is used instead.

> Also in the mail archives, some reference is made to documentation
> about creating your own inittab file. Does that documentation still
> exist somewhere? I've looked but can't find it.

You should refer to the Busybox documentation, as this is not something
related to Buildroot directly. See examples/inittab in Busybox sources.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
