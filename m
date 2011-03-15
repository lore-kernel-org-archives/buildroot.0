From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2011 19:22:11 +0100
Subject: [Buildroot] inittab for Busybox
In-Reply-To: <1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
Message-ID: <20110315192211.3c59f861@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Mar 2011 14:14:09 -0400
"Heyendal, Carl" <CHeyendal@stanleyworks.com> wrote:

> Hmmmm....I unselected the sysvinit option in busybox and recompiled
> from Buildroot.

Yes, but you didn't do "make clean; make", so the etc/inittab in the
target is still the one from sysvinit.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
