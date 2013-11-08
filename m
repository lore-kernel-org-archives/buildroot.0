From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Fri, 8 Nov 2013 14:52:24 +0200
Subject: [Buildroot] [git commit] openpgm: disable on AVR32
In-Reply-To: <20131108131715.0c03641e@skate>
References: <20131107085841.8061F9BB05@busybox.osuosl.org>
 <20131108131715.0c03641e@skate>
Message-ID: <CAAHaz6FVAvhHKNYXyfvkPc50kbgAeX2JdTRA8JRMh06G=U1xHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter, Simon,

2013/11/8 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Since for external toolchains we don't have any information about
> the compiler version being used, I would in fact suggest to revert
> back to 'depends on !BR2_avr32' as you proposed originally.

How stupid of me to miss it also. I'm sorry to be a monkey :) Will send
an updated patch. Or should I send a 'fix patch', Peter?

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131108/6c54ce20/attachment.html>
