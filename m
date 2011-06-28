From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 28 Jun 2011 15:29:13 +0200
Subject: [Buildroot] [PATCH] New packages: acl and attr
In-Reply-To: <20110628152455.0b2aa6a4@skate>
References: <4E09922C.6060803@visionsystems.de>	<20110628104841.731f2371@skate>	<4E09D287.5060608@visionsystems.de>
 <20110628152455.0b2aa6a4@skate>
Message-ID: <4E09D729.2040207@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 28.06.2011 15:24, schrieb Thomas Petazzoni:
> Le Tue, 28 Jun 2011 15:09:27 +0200,
> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>
>> These passages are needed because of non-conform installation routine
>> (as far as I can see). Otherwise installation script would try to
>> install the files to /usr/ directly.
> This should not happen with autotools-based packages. Are you sure ?

I know it shouldn't, but this is the behavior I observe.

Yegor
