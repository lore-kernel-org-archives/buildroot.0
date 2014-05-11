From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 May 2014 22:37:35 +0200
Subject: [Buildroot] Autobuilder news
In-Reply-To: <20140511182949.55e5e115@free-electrons.com>
References: <20140504223611.5a6177c1@skate>	<536E8BEB.7020300@mind.be>
 <20140511182949.55e5e115@free-electrons.com>
Message-ID: <536FDF8F.3040704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/14 18:29, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Sat, 10 May 2014 22:28:27 +0200, Arnout Vandecappelle wrote:
> 
>>  Is it possible that you installed new binaries with the same name but a
>> different ctng configuration? That's a bit annoying because it breaks
>> reproducibility... It's OK to remove the old toolchains, but it would be good if
>> the new ones would have a different name.
> 
> No, it is not possible. The new toolchains have a different tarball
> name, and all the tarballs from the previous ctng configurations have
> been kept. So all builds made on the Free Electrons build server should
> be fully reproducible.
> 
> Have you found any specific issue?

 No, just that when I tried one of the new toolchains it didn't download because
it was already there. But I guess I must have forgotten that I had downloaded it
before, then.

 Sorry for the noise.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
