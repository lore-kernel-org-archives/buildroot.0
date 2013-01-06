From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Jan 2013 15:41:52 +0100
Subject: [Buildroot] [PATCH] Fix installation of crosstool-ng libraries
 to target
In-Reply-To: <201301061229.18437.yann.morin.1998@free.fr>
References: <1357449105-14780-1-git-send-email-bos@je-eigen-domein.nl>
 <201301061206.37057.yann.morin.1998@free.fr>
 <87hamuh8by.fsf@dell.be.48ers.dk>
 <201301061229.18437.yann.morin.1998@free.fr>
Message-ID: <20130106154152.123e9eef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 6 Jan 2013 12:29:18 +0100, Yann E. MORIN wrote:

> It also means that people seldom use the ct-ng backend, and people either
> use the internal backend, or external toolchains. So, a couple of questions:
>   - should we finally switch over to using the ct-ng backend by default?
>   - is it worth maintaing the ct-ng backend at all?

As far as autobuilders are concerned, the ct-ng backend is tested, but
this bug was apparently not breaking the build, but only the execution.
Therefore, it was not detected by the autobuilders.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
