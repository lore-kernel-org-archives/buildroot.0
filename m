From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 16:14:57 +0200
Subject: [Buildroot] [PATCHv2] package/qpid-proton: needs host-python2
In-Reply-To: <1436882619-30664-1-git-send-email-yann.morin.1998@free.fr>
References: <1436882619-30664-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150714161457.4092e1ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 14 Jul 2015 16:03:39 +0200, Yann E. MORIN wrote:
> qpid-proton is using constructs that are not valid in python3.
> qpid-proton is hardcoding calls to /usr/bin/python, which can be
> whatever version.
> 
> So, fix the scripts to use '/usr/bin/env python' so it finds it in the
> PATH, and add a dependency to host-python.

This commit log no longer matched the implementation. So I fixed that
up and applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
