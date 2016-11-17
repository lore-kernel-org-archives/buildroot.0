From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Nov 2016 00:54:27 +0100
Subject: [Buildroot] [PATCH 02/10] core: add waf-package infra
In-Reply-To: <20161117204446.GC3574@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <6556713514fd3c751384c5ea655420dba5e8876a.1477843328.git.yann.morin.1998@free.fr>
 <20161117000239.36cd4e77@free-electrons.com> <20161117204446.GC3574@free.fr>
Message-ID: <2c052e9a-52e9-2e77-5f1c-a2db94aed9a5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-11-16 21:44, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-11-17 00:02 +0100, Thomas Petazzoni spake thusly:
>> On Sun, 30 Oct 2016 17:02:13 +0100, Yann E. MORIN wrote:
[snip]
>>> +# If the package does not have its own waf, use our own.
>>> +ifeq ($$($(2)_BUNDLED_WAF),NO)
>>
>> Where is the default value of this variable defined? It seems it's not
>> defined anywhere, while it should be set to "YES".
> 
> We don't really need to set a default, because we're not testing the
> default. We're only testing if it was set by the package.

 We do set a default for all other YES/NO variables.


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
