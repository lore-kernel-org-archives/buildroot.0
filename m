Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C399C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 07:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0775741634;
	Mon, 11 Jul 2022 07:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0775741634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6NUqC4EzaCf; Mon, 11 Jul 2022 07:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ACBC415AB;
	Mon, 11 Jul 2022 07:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ACBC415AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D7D61BF40F
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 07:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAE9A6072A
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 07:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAE9A6072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CzWzIRuZwO7v for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 07:40:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CCCE6060A
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CCCE6060A
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 07:40:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (8)
Received: from [192.168.65.245] (95.143.241.142.ultranet.net.pl
 [95.143.241.142])
 by server220076.nazwa.pl (Postfix) with ESMTP id 4E8361BC2AF;
 Mon, 11 Jul 2022 09:40:21 +0200 (CEST)
Message-ID: <b7e3bad2-990b-659b-745e-bf75b8ad59d3@grinn-global.com>
Date: Mon, 11 Jul 2022 09:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220711053921.499C01BBBA2@server220076.nazwa.pl>
From: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
In-Reply-To: <20220711053921.499C01BBBA2@server220076.nazwa.pl>
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-07-10
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5449483262209165522=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============5449483262209165522==
Content-Type: multipart/alternative;
 boundary="------------2YvGPCNqDLlcsXUEpD0AM4h1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2YvGPCNqDLlcsXUEpD0AM4h1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Thomas,

On 7/11/22 07:39, Thomas Petazzoni wrote:
> Hello,
>
> Outdated packages
> =================
>
> This is the list of packages for which a new version has been detected
> and for which you are a registered developer. Please help us improving
> the quality of Buildroot by bumping these packages to their latest
> version.
>
>               name              | found by |        link to release-monitoring.org        |   version    |   upstream
> -------------------------------+----------+----------------------------------------------+--------------+--------------
>                  python-esptool |  DISTRO  |https://release-monitoring.org/project/11619  | 4.0          | 4.1

https://patchwork.ozlabs.org/project/buildroot/patch/20220710084928.537249-1-b.bilas@grinn-global.com/ 
patch already sent.

Best
Bartek
>
> Thanks for your contribution to Buildroot!
>
-- 
*BARTOSZ BIŁAS*
Embedded Software Developer 	GRINN

TEL.+48 71 716 40 99
WEB. grinn-global.com
	Grinn sp. z o.o.
Strzegomska 140a
54-429 Wrocław
	KRS:0000230049
NIP:8992730302
REGON:020047322 	Sąd Rejonowy we Wrocławiu
VI Wydział Gospodarczy
Kapitał zakładowy: 125.000,00 zł


--------------2YvGPCNqDLlcsXUEpD0AM4h1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Thomas,<br>
    </p>
    <div class="moz-cite-prefix">On 7/11/22 07:39, Thomas Petazzoni
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220711053921.499C01BBBA2@server220076.nazwa.pl">
      <pre class="moz-quote-pre" wrap="">Hello,

Outdated packages
=================

This is the list of packages for which a new version has been detected
and for which you are a registered developer. Please help us improving
the quality of Buildroot by bumping these packages to their latest
version.

             name              | found by |        link to release-monitoring.org        |   version    |   upstream  
-------------------------------+----------+----------------------------------------------+--------------+--------------
                python-esptool |  DISTRO  | <a class="moz-txt-link-freetext" href="https://release-monitoring.org/project/11619">https://release-monitoring.org/project/11619</a> | 4.0          | 4.1         </pre>
    </blockquote>
    <p><a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/buildroot/patch/20220710084928.537249-1-b.bilas@grinn-global.com/">https://patchwork.ozlabs.org/project/buildroot/patch/20220710084928.537249-1-b.bilas@grinn-global.com/</a>
      patch already sent.</p>
    Best<br>
    Bartek<br>
    <blockquote type="cite"
      cite="mid:20220711053921.499C01BBBA2@server220076.nazwa.pl">
      <pre class="moz-quote-pre" wrap="">

Thanks for your contribution to Buildroot!

</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <title></title>
      <table width="800" height="115" cellspacing="2" cellpadding="2"
        border="0">
        <tbody>
          <tr>
            <td rowspan="1" colspan="4" valign="top"><font size="+1"
                face="Arial"><b>BARTOSZ BIŁAS</b></font><font size="+1"
                face="Arial"><br>
              </font></td>
          </tr>
          <tr>
            <td width="250" valign="top"><font face="Arial">Embedded
                Software Developer</font></td>
            <td rowspan="1" colspan="3" style="border-left-color:
              rgb(182, 193, 52); border-left-width: 2px;
              border-left-style: solid;" valign="top"><font face="Arial">GRINN
              </font></td>
          </tr>
          <tr>
            <td rowspan="1" colspan="4" valign="top"> <br>
            </td>
          </tr>
          <tr>
            <td style="border-left-width: 2px; border-left-style: solid;
              border-left-color: rgb(182, 193, 52);" valign="top"> <font
                size="-1" face="Arial" color="#b6c134">TEL.</font><font
                size="-1" face="Arial"> +48 71 716 40 99<br>
                <font color="#b6c134">WEB.</font> grinn-global.com<br>
              </font></td>
            <td style="border-left-style: solid; border-left-color:
              rgb(182, 193, 52); border-left-width: 2px;" valign="top"><font
                size="-1" face="Arial">Grinn sp. z o.o.<br>
              </font><font size="-1" face="Arial">Strzegomska 140a<br>
                54-429 Wrocław</font><font size="-1" face="Arial"><br>
              </font></td>
            <td style="border-left-style: solid; border-left-width: 2px;
              border-left-color: rgb(182, 193, 52);" valign="top"><font
                style="font-style: normal; font-variant-ligatures:
                normal; font-variant-caps: normal; font-weight: 400;
                letter-spacing: normal; text-align: start; text-indent:
                0px; text-transform: none; white-space: normal;
                word-spacing: 0px; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);
                text-decoration-style: initial; text-decoration-color:
                initial;" size="-1" face="Arial" color="#b6c134">KRS:</font><font
                style="color: rgb(0, 0, 0); font-style: normal;
                font-variant-ligatures: normal; font-variant-caps:
                normal; font-weight: 400; letter-spacing: normal;
                text-align: start; text-indent: 0px; text-transform:
                none; white-space: normal; word-spacing: 0px;
                -webkit-text-stroke-width: 0px; background-color:
                rgb(255, 255, 255); text-decoration-style: initial;
                text-decoration-color: initial;" size="-1" face="Arial"><span> </span>0000230049<br>
                <font color="#b6c134">NIP:</font><span> </span>8992730302<br>
                <font color="#b6c134">REGON:</font><span> </span>020047322</font></td>
            <td style="border-left-color: rgb(182, 193, 52);
              border-left-style: solid; border-left-width: 2px;"
              valign="top"><font size="-1" face="Arial">Sąd Rejonowy we
                Wrocławiu<br>
                VI Wydział Gospodarczy<br>
                Kapitał zakładowy: 125.000,00 zł</font></td>
          </tr>
        </tbody>
      </table>
      <br>
    </div>
  </body>
</html>

--------------2YvGPCNqDLlcsXUEpD0AM4h1--

--===============5449483262209165522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5449483262209165522==--
