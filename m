From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Oct 2011 06:52:53 -0300
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH_4/6=5D_qemu=5Fx86=3A_update_to_ker?=
 =?utf-8?q?nel_3=2E1_and_add_readme?=
In-Reply-To: <87aa8py4ai.fsf@macbook.be.48ers.dk>
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
 <1319485334-15790-4-git-send-email-gustavo@zacarias.com.ar>
 <87aa8py4ai.fsf@macbook.be.48ers.dk>
Message-ID: <a0295126a06f4884db6a02d03c460db8@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25.10.2011 03:27, Peter Korsgaard wrote:

> Why not qemu-system-i386? I would prefer to have console=ttyS0,115200 
> on
> the cmdline as well.

qemu-system-i386 is deprecated.
When it's present, and that doesn't hold true for every distro, it's 
just a symlink to qemu-system-x86_64.

> And then change this line.
> Please keep it on ttyS0.

Any particular reason for this on x86?
It would make things simpler to test graphics apps (X11) keeping it 
PC-like IMHO.
Regards.
