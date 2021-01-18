From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2021 21:15:37 +0100
Subject: [Buildroot] Buildroot on Windows Subsystem for Linux (WSL)
In-Reply-To: <87h7njrilt.fsf@paral.in> (Christian Stewart's message of "Thu,
 14 Jan 2021 01:08:30 -0800")
References: <87h7njrilt.fsf@paral.in>
Message-ID: <878s8qf1cm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi all,

 > Windows Subsystem for Linux 1.0 runs a userspace without a kernel, and
 > 2.0 runs a full Linux Kernel inside a VM.

 > SkiffOS, using Buildroot, now supports WSL with the "virt/wsl" package.
 > This could be extracted from Skiff and submitted to mainline Buildroot
 > as a "board" configuration as well.

 > https://github.com/skiffos/SkiffOS/tree/master/configs/virt/wsl

 > The Buildroot system works as expected in the WSL environment. The
 > buildroot output tar.gz can be imported directly into WSL 2.0. WSL 1.0
 > requires using the WSL-DistroLauncher project to load the distribution
 > via a Windows Appx.

 > This is an interesting way to use Buildroot under Windows.

Cute. Besides the fact that you are booting a (heavily patched) Linux
kernel, is there any specific advantages to just creating a docker
container or a classic VM from a Buildroot build?

-- 
Bye, Peter Korsgaard
