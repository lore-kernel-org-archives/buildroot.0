From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 17:36:58 +0100
Subject: [Buildroot] QUILT helper
In-Reply-To: <50F92F70.2070808@syscom-instruments.com>
References: <50F92F70.2070808@syscom-instruments.com>
Message-ID: <50FACBAA.7020602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/01/13 12:18, Viallard Anthony wrote:
> Hi,
>
> It will be nice having a quilt helper like openwrt has.
>
>   QUILT=1 make ofono
>
> Et voil?, with this command, builroot use quilt to apply patches. So, if
> you need to edit a patch, you just go in the build dir, use quilt pop,
> quilt refresh, quilt push -a and use a new command to update the eddited
> patch :
>
>   make ofono-refresh
>
> I known christmas was few days ago but if you include this idea, I will
> be happy like when santa claus gave me a SEGA master system.

  I've been thinking about a feature to make it easier to create patches, 
but I was thinking in terms of git rather than quilt.

  None of the core buildroot developers uses quilt AFAIK, so don't expect 
your wish to be granted out of nowhere. But I for one am definitely open 
to consider patches that make it easier to create package patches!

  If you do contribute this feature, don't forget to include sufficient 
documentation in the manual so someone who has no experience with quilt 
can get going right away.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
