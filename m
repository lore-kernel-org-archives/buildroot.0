From: yuanlinyu <cugyly@163.com>
Date: Tue, 25 Aug 2015 07:39:53 +0800 (CST)
Subject: [Buildroot] BR2_arm1136j_s in config.in.arm
In-Reply-To: <87twrpzks2.fsf@dell.be.48ers.dk>
References: <7904fb17.d9ed.14f2728c6c5.Coremail.cugyly@163.com>
 <87twrpzks2.fsf@dell.be.48ers.dk>
Message-ID: <6eb08afc.de8.14f621518bd.Coremail.cugyly@163.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi peter,now I am using M82359 VOIP processer, it's simple introduction as below,Comcerto 300 devices are available in two different varieties: Master (M8235x) and Slave (M8234x). Master 
devices include both an MSP subsystem (ARM1136J-S + DSP array) and a CSP subsystem (ARM1136J-S), while 
Slave devices include only the MSP subsystem.

now i work on csp core, it's have no vfp.


thanks


At 2015-08-24 06:45:33, "Peter Korsgaard" <peter@korsgaard.com> wrote:
>>>>>> "yuanlinyu" == yuanlinyu  <cugyly@163.com> writes:
>
> > hi,
> > "BR2_arm1136j_s" in config.in.arm seems not work because no
> > BR2_arm1136j_s configuration item. how to configure buildroot for soc
> > with arm1136j-s cpu?
>
> > config BR2_GCC_TARGET_CPU
> > 	default "arm920t"	if BR2_arm920t
> > 	default "arm922t"	if BR2_arm922t
> > 	default "arm926ej-s"	if BR2_arm926t
> > 	default "arm1136j-s"	if BR2_arm1136j_s
>
>Hmm, you're right. I've added it now to git master.
>
>I don't think I have ever seen a non-vfp variant of the arm1136 in the
>wild. What SoC are you using?
>
>-- 
>Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150825/5c1e75f6/attachment.html>
