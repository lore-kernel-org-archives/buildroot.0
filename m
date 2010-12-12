From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 11:51:12 +0100
Subject: [Buildroot] [PATCH 01/15] toolchain: Improve C library option
	selection
In-Reply-To: <87oc8slzxv.fsf@macbook.be.48ers.dk>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<ca79dc87ecbeff3cfc20427c3ec3a54ca3a98c94.1291541115.git.thomas.petazzoni@free-electrons.com>
	<87oc8slzxv.fsf@macbook.be.48ers.dk>
Message-ID: <20101212115112.2f9d0717@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Dec 2010 23:14:36 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> This breaks the toolchain setup of people's existing .config's, but
> OK - Perhaps add a note about it in the commit message though.

Done.

> The other places we have 'Enable ... SUPPORT'

Ok, done. For many other places as well.

> We normally don't do spaces before question mark (several places in
> this file).

Ok, done.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
