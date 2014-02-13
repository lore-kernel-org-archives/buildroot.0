From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Feb 2014 08:46:17 +0100
Subject: [Buildroot] [pkg-perl infra V9 4/6] host-perl-module-build: new
 package
In-Reply-To: <CAB0FRstzeL8mhTEHTaZ_ebVbG4cc1a_kXiHHqtVN8wNTXS2_fQ@mail.gmail.com>
References: <1392192871-426-1-git-send-email-francois.perrad@gadz.org>	<1392192871-426-5-git-send-email-francois.perrad@gadz.org>	<52FBF400.4010109@mind.be>
 <CAB0FRstzeL8mhTEHTaZ_ebVbG4cc1a_kXiHHqtVN8wNTXS2_fQ@mail.gmail.com>
Message-ID: <52FC7849.4020206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/14 01:32, Fran?ois Perrad wrote:
> 2014-02-12 23:21 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>> On 12/02/14 09:14, Francois Perrad wrote:
>>> the version coming with host-perl is too old
>>
>>  That depends on the host's perl of course :-)
>>
> 
> Some Perl packages depend on very recent versions of Module-Build
> which are not yet shipped with a stable perl version.
> But the cpan client is able to update Module-Build as pre-requirement.
> On Buildroot, we must install the latest Module-Build.

 OK.

 If you would need to send yet another version of the series, can you
include this piece of text in the commit message?

 Regards,
 Arnout

> 
> Fran?ois
> 
>>>
>>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>>> Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
