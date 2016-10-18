From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Oct 2016 00:09:30 +0200
Subject: [Buildroot] [Patch v3 1/2] rust-bootstrap: new package
In-Reply-To: <20161018204701.GA18610@itchy>
References: <1468533676-10894-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1468533676-10894-2-git-send-email-eric.le.bihan.dev@free.fr>
 <2a62ef7a-1d5f-546d-0287-78cb505a0ec3@mind.be> <20161018204701.GA18610@itchy>
Message-ID: <ee04066a-2251-60d0-78f5-3fd3e0525bf1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-10-16 22:47, Eric Le Bihan wrote:
> Hi!
> 
> On 16-10-16 13:27:51, Arnout Vandecappelle wrote:
>>
>>
>> On 15-07-16 00:01, Eric Le Bihan wrote:
[snip]
>>> +RUST_BOOTSTRAP_LICENSE = Apache-2.0, MIT
>>
>>  Can you specify which parts or under which license?
> 
> Rust is dual licensed (Apache-2.0 OR MIT). So, I'll change it to:
> 
> RUST_BOOTSTRAP_LICENSE = Dual Apache-2.0/MIT

 No, it should be

RUST_BOOTSTRAP_LICENSE = Apache-2.0 or MIT

See the example in the manual under the generic package infra [1].


 Regards,
 Arnout

[1] https://buildroot.org/downloads/manual/manual.html#generic-package-reference

> 
> I'll do the same for the rust package.
> 
> Thanks for the review.
> 
> Best regards,
> 
> --
> ELB
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
