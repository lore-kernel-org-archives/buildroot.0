Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21CEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 19:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 595E240900;
	Wed, 23 Feb 2022 19:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUmcsNkXQ4OP; Wed, 23 Feb 2022 19:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DA2F403E9;
	Wed, 23 Feb 2022 19:40:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 759B91BF5EA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70C43415D4
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7V9G21dkTv9S for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 19:40:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D823415D3
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 19:40:42 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MxVBnwJToo6PDMxVBn6q3C; Wed, 23 Feb 2022 20:40:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645645241; bh=SADaWjyquf7+fR+TnkDAIgIDfjg5vWDHOn+RKtaj/4A=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ATorp62IGoMXFJhRPWDgds3HYBPxJZGck+m536xU6FQk/Uzh9v0io8tAEMOH/y1QA
 NfJ8aE49tbdyajSujZH/1myzKFfFeUN+cf42zDML2cbkoKRhf/6rkuTZxGCnb6asy6
 +Ho8ap1x9MsDLZN61291iMQoQPFCrhVY2SvhZlYajRCrnpUW0UJFdknkQzk4QW6l3r
 +K6EHiBRNy9ZPSJytZjtINboEkDd12kGSyzxA2lMG+9iunbys6+bAEObwe8pxu9Xvo
 7KAzG+9vQum0XSjJRxHkEHuPeVhVrpgQuybt8LKTdENPFyaKG9ep64swpQPd/7Y3Vy
 6shskh0Wh8Y0g==
Message-ID: <cd0e3d78-4e9e-bf70-67ac-056f06f6f2cb@benettiengineering.com>
Date: Wed, 23 Feb 2022 20:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220223191436.3045255-1-geomatsi@gmail.com>
 <20220223191436.3045255-5-geomatsi@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220223191436.3045255-5-geomatsi@gmail.com>
X-CMAE-Envelope: MS4wfPdhVVo31bntoVLrdPpZZxNy2iANIYE979JepT3oCVdjurUl3mROr4PtiyUjgoGFSnHjeIn85d08Dk67kB+ytAFJVy3cuwXzV0IKjG6mO2ALpcu+T3aT
 T9gvo7MWQ8dnxkk385q25CUSTm0nodjNADbb7uzTbMRjNTylIfF5Nim4rG82yFchezGdAzrCuvkZkB1ssnt7riuLB874n3IEoPH9az6gi5W5pMQoTNI2bOsR
 JON62Timq448jNVWuxw4IX4lTGQkzKFm9miHikE4cKQ=
Subject: Re: [Buildroot] [PATCH 4/4] DEVELOPERS: add myself for
 orangepi-zero-plus2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

please change the subject into:
'DEVELOPERS: add Sergey Matyukevich for orangepi-zero-plus2'

because if you issue:
$ git log --oneline
you can't know who has been added.
So please send a V2.

Thank you!

-- 
Giulio Benetti
Benetti Engineering sas

On 23/02/22 20:14, Sergey Matyukevich wrote:
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>   DEVELOPERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ac702d8d0f..f29e889c52 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2545,10 +2545,12 @@ F:	board/linksprite/pcduino
>   F:	board/orangepi/orangepi-zero
>   F:	board/orangepi/orangepi-one
>   F:	board/orangepi/orangepi-pc-plus/
> +F:	board/orangepi/orangepi-zero-plus2/
>   F:	configs/linksprite_pcduino_defconfig
>   F:	configs/orangepi_one_defconfig
>   F:	configs/orangepi_pc_plus_defconfig
>   F:	configs/orangepi_zero_defconfig
> +F:	configs/orangepi_zero_plus2_defconfig
>   F:	package/armbian-firmware/
>   F:	package/hostapd/
>   F:	package/rtl8189fs/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
