From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Feb 2010 22:02:50 +0100
Subject: [Buildroot] [PATCH 3/6] Move BR2_SOFT_FLOAT and BR2_VFP_FLOAT
 to Build options
In-Reply-To: <871vhanqks.fsf@macbook.be.48ers.dk>
References: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
	<cover.1263338839.git.thomas.petazzoni@free-electrons.com>
	<dec9e118437c50f39437596da1717c5117b8d416.1263338839.git.thomas.petazzoni@free-electrons.com>
	<871vhanqks.fsf@macbook.be.48ers.dk>
Message-ID: <20100209220250.367631fd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Jan 2010 17:26:27 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> The soft floating point related options not only affect how
>  Thomas> the toolchain is built, but more importantly affect how
>  Thomas> packages are built. Therefore, just like optimization or
>  Thomas> stripping options, floating point related options are
>  Thomas> global, and belong to the Build options menu.
> 
> Hmm, couldn't you say the same for ipv6, largefile and locale stuff?

Hum, true. I will keep them in the Toolchain part, and will resend the
full patch set.

Do you agree with the other patches of the patch set ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
