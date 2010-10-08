From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Fri, 08 Oct 2010 21:43:22 +0200
Subject: [Buildroot] [PATCH 19/21] openssl: bump to 1.0.0a
In-Reply-To: <AANLkTinSYaHEfjFCon+K51hapZrc_COCvBvH_06Pj3qt@mail.gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>	<1284864823-18993-20-git-send-email-Martin.Banky@gmail.com>	<4C95E051.4010507@googlemail.com>	<AANLkTik2f=4p9jfBuuQ+3P1vq6wu6EjM15nUke-J4RO3@mail.gmail.com>
	<AANLkTinSYaHEfjFCon+K51hapZrc_COCvBvH_06Pj3qt@mail.gmail.com>
Message-ID: <4CAF745A.2030100@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 22.09.2010 01:04, schrieb Martin Banky:
> Marcus,
>      I've done some research, and have not found any issues with 
> openssl 1.0.0.a not being compatible with any packages. If anyone 
> knows of one, please let me know. Note: openssl 1.0.0a is not 
> necessarily binary compatible to openssl 0.9.8o, but it is api compatible.
>
Hi Martin,

Yes. You are right. I discovered only a CApath incompatibility if 
generating some CA keystore with 0.9.8 and using it with 1.0.0 won't 
work. If you generate the keystores yourself there should be no problem 
with updating to openssl 1.0.0.

So no complains anymore ;-)

Regards,
Marcus
