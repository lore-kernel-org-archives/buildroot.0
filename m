From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Oct 2015 23:28:55 +0100
Subject: [Buildroot] [PATCH] uclibc: get rid of ARC's uClibc fork
In-Reply-To: <20151027225741.333ad3f6@free-electrons.com>
References: <1445959005-23917-1-git-send-email-abrodkin@synopsys.com>
 <562FCCF2.8090208@mind.be> <20151027225741.333ad3f6@free-electrons.com>
Message-ID: <562FFAA7.9000205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27-10-15 22:57, Thomas Petazzoni wrote:
> Arnout,
> 
> On Tue, 27 Oct 2015 20:13:54 +0100, Arnout Vandecappelle wrote:
>> On 27-10-15 16:16, Alexey Brodkin wrote:
>>> For quite some time all ARC changes have been pushed upstream.
>>> So both uClibc master branch 
>>
>>  In that case, perhaps the snapshot version should be enabled for ARC?
> 
> To be honest, I am wondering if this snapshot thing is really useful in
> any way. Is anyone really using this ? Why do we have this for uClibc
> and not for any other package ?

 I guess because buildroot was started as a build system for uClibc... The
initial version of buildroot (ffde94bd2) even only supported snapshot.

 Now that there are actual releases of uClibc, I see little reason to support
snapshots. And you anyway can still use _OVERRIDE_SRCDIR.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
