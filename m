From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 05 Jun 2015 22:37:43 +0200
Subject: [Buildroot] [PATCH 1/3] atf: new package
In-Reply-To: <5570B544.2060502@savoirfairelinux.com>
References: <1433357276-7083-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<1433357276-7083-2-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<556F7747.4060408@mind.be>
 <5570B544.2060502@savoirfairelinux.com>
Message-ID: <55720897.3040006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 22:29, Sebastien Bourdelin wrote:
> Hi Arnout.
> 
> On 06/03/2015 05:53 PM, Arnout Vandecappelle wrote:
>> On 06/03/15 20:47, Sebastien Bourdelin wrote:
[snip]
>>> +ATF_SITE = https://github.com/jmmv/atf/archive
>>  There's an uploaded archive at
>> https://github.com/jmmv/atf/releases/download/atf-0.21/atf-0.21.tar.gz
>> (same for 0.20). Then you don't need to AUTORECONF. Well, except that it has the
>> unreleased libtool beta which means that our patch doesn't apply so you need to
>> to autoreconf after all. But anyway, we prefer the uploaded archive.
> Ok, i will go for the uploaded archive, do you prefer a comment above
> the AUTORECONF to explain it's still required and when it could be
> remove, a TODO in fact ?

 Yes, please add a comment like lzo:

# Ships a beta libtool version hence our patch doesn't apply.


 Regards,
 Arnout


[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
