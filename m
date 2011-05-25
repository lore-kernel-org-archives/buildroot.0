From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2011 10:46:34 +0200
Subject: [Buildroot] Fwd: How to enable Oprofile while using external
 tool chain?
In-Reply-To: <BANLkTimSZBQwAUfcmF=73DR-4BM4nW3cBw@mail.gmail.com>
References: <BANLkTikQOCg+ZQy1qc34GWBEo-u7QC41Fg@mail.gmail.com>
	<BANLkTik5J8hTD_OvXrTZ3KYgHGUGPZqGqg@mail.gmail.com>
	<BANLkTimSZBQwAUfcmF=73DR-4BM4nW3cBw@mail.gmail.com>
Message-ID: <20110525104634.362bc9b9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 May 2011 10:28:20 +0200
Beno?t Mauduit <benoit.mauduit@gmail.com> wrote:

> If you want to test, i've made a patch (not very clean) and it's work
> with an external toolchain.

Your patch says that it builds a host-binutils, but it's wrong: what it
builds is binutils for the target.

Otherwise, would be great to have a proper patch that makes this
possible, and that we could merge into Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
