From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Mar 2010 22:34:48 +0200
Subject: [Buildroot] init segfaults when compiled with glibc
In-Reply-To: <4BB2592B.4080502@browserseal.com>
References: <4BB2592B.4080502@browserseal.com>
Message-ID: <20100330223448.0dd60fa9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sasha,

On Tue, 30 Mar 2010 23:03:55 +0300
Sasha Sirotkin <buildroot@browserseal.com> wrote:

> It looks like glibc does not work at all with buildroot right now. 
> Should I open a bug ticket or something?

Unfortunately, without more details, a bug report would be fairly
useless. Can you send your Buildroot .config and kernel .config so that
I can try to reproduce your problem on my AT91 systems ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
