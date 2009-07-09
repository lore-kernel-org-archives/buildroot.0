From: Paul Archer <ptarcher@gmail.com>
Date: Thu, 9 Jul 2009 12:36:57 +1000
Subject: [Buildroot] [PATCH 1/2] target/ubifs: fix compilation
In-Reply-To: <20090604180524.GB26148@buzzloop.caiaq.de>
References: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
	<20090604180524.GB26148@buzzloop.caiaq.de>
Message-ID: <56ea0bb80907081936t4df42a28m549a990efedd584f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Daniel,

I tried the patches and they worked fine for me.
Managed to build a UBIFS fine, nearly even got it to mount it :P
(thats for another day)

Regards Paul

On Fri, Jun 5, 2009 at 4:05 AM, Daniel Mack<daniel@caiaq.de> wrote:
> On Wed, Jun 03, 2009 at 01:39:04PM +0200, Daniel Mack wrote:
>> The ubifs rootfs target does not currently build because the repository
>> listed in ubifsroot.mk does not exist anymore. Consequently, the used
>> tag is also wrong.
>
> Any oppinion about this one and the follow-up, '2/2'?
>
> Daniel
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
----
Regards
Paul Archer
ptarcher at gmail.com
