From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 14:49:06 +0100
Subject: [Buildroot] [RFC 01/11] common service startup files
In-Reply-To: <20150322123914.GB21403@vostro>
References: <cover.1426960081.git.alex.suykov@gmail.com>
 <3116b4122f3e3ea776ce2739c11ee36ea967297f.1426960081.git.alex.suykov@gmail.com>
 <550E057E.2030605@mind.be> <20150322123914.GB21403@vostro>
Message-ID: <550EC852.4070102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/03/15 13:39, Alex Suykov wrote:
>> >  - The script should only handle cases that are actually used. So start with
>> > something extremely simple that covers a few interesting cases, and leave the
>> > others to use the old initscripts system.
> Why I was trying handle as many packages as possible: I'm pretty sure something
> like 80% of them will work immediately with only the basic support,
> but it would be really bad to find a show-stopper among the remaining 20%.
> Something that would require changing the way the whole thing works.
> 
> Perhaps it's ok to drop bad cases for now, leave them as initscripts-only
> and expect the users do something about the unsupported cases themselves.

 I think it's important that there is always a fallback with custom stuff. And
for me, it's perfectly OK if the infrastructure handles only 50% of the cases
and the other 50% have to be custom.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
