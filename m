From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Oct 2011 09:10:21 -0300
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH_5/6=5D_qemu=5Fsh4=5Fr2d=3A_update_?=
 =?utf-8?q?to_kernel_3=2E1_and_update_readme?=
In-Reply-To: <87zkgpuzw4.fsf@macbook.be.48ers.dk>
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
 <1319485334-15790-5-git-send-email-gustavo@zacarias.com.ar>
 <87ehy1y4eg.fsf@macbook.be.48ers.dk>
 <d232d63f548d58fc6d7af13f979b9153@zacarias.com.ar>
 <87zkgpuzw4.fsf@macbook.be.48ers.dk>
Message-ID: <a60caa8f23b8ea6af493627a9ad91833@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25.10.2011 07:30, Peter Korsgaard wrote:

>  Gustavo> Me too for real embedded targets unlike qemu-system-x86.
>  Gustavo> Unfortunately either qemu 0.14 doesn't emulate the UART 
> and/or the
>  Gustavo> real target doesn't have one.
>
> Ok, I'll commit it then - Thanks.

Found a fix.
It seems there were kernel changes and qemu behaviour changes too that 
prevented it from showing up and working.
Patches will follow.
