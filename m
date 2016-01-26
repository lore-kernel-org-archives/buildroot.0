From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Jan 2016 23:08:15 +0100
Subject: [Buildroot] [PATCH 6/8] uclibc: remove 0.9.33 version
In-Reply-To: <56A6AC3E.6070908@gmail.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <56A6ABA8.1060708@gmail.com> <56A6AC3E.6070908@gmail.com>
Message-ID: <56A7EE4F.4010102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26-01-16 00:14, Romain Naour wrote:
> Thomas, All,
> 
> Le 18/01/2016 21:24, Thomas Petazzoni a ?crit :
>> The upstream project is dead, the 0.9.33 version requires tons of
>> patches, and uclibc-ng has now successfully replaced uclibc. It is
>> time to get rid of the 0.9.33 version.
> 
> For some reason I had some issue to apply the patch with pwclient (too many
> lines removed at once ? :p )
> 
> There is no legacy handling for BR2_UCLIBC_VERSION_0_9_33.

 I don't think legacy handling is needed. Bumping to uClibc-ng is like bumping
to uClibc-0.9.33.3, so it's OK if it happens without blocking the config.

 What is a bit more annoying is that the old BR2_UCLIBC_CONFIG will no longer
work. But not much can be done about that.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
