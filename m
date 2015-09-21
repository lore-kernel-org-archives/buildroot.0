From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Mon, 21 Sep 2015 18:03:51 +0100
Subject: [Buildroot] Generating a defconfig
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474C34AFB@svr-wa-exch1.atg.lc>
References: <56002C63.1070806@synopsys.com>
 <944894A3EB1D044A9003B2F944389BB20474C34AFB@svr-wa-exch1.atg.lc>
Message-ID: <56003877.6060600@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tommy!

On 9/21/2015 6:01 PM, Lee, Tommy wrote:
> Joao,
> 
> I believe you need to do the "make linux-menuconfig" command to create your own .config file. To my knowledge, all the configs/defconfig files come along the Buildroot installation. They might not be good for your board.

I need to generate a defconfig of the ARM Juno r1 board to submit to Buildroot,
not build an existent buildroot' defconfig.
i already have the .config, but I would like to generate a clean defconfig. Is
there a std way or is a manual operation?

> 
> Tommy
> 
> -----Original Message-----
> From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of Joao Pinto
> Sent: Monday, September 21, 2015 9:12 AM
> To: buildroot at buildroot.org
> Subject: [Buildroot] Generating a defconfig
> 
> Hi all!
> 
> I am about to generate a buildroot' defconfig for ARM Juno r1 board, and I would like to know what is the std procedure to make this on buildroot.
> 
> Thanks,
> Joao
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
> 

Thanks,
Joao
