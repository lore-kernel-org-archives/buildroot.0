From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Oct 2017 23:31:22 +0200
Subject: [Buildroot] [PATCH 03/12] docker-engine: add support for init
 processes
In-Reply-To: <CA+h8R2oWPvzJMZh9ZM91oe2nakty9Yn_NjCnDS9e4SyVnZh49Q@mail.gmail.com>
References: <20171019002257.27646-1-christian@paral.in>
 <20171019002257.27646-3-christian@paral.in>
 <20171021155147.12c12362@windsurf>
 <CA+h8R2oWPvzJMZh9ZM91oe2nakty9Yn_NjCnDS9e4SyVnZh49Q@mail.gmail.com>
Message-ID: <762a0020-823d-a96a-51f2-afd54673181d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-10-17 05:29, Christian Stewart wrote:
> Hi Thomas,
> 
> On Sat, Oct 21, 2017 at 9:51 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Did you meant "dump-init" here instead of "docker-init" ?
> 
> No, definitely not.

 I think you did. You had written

The docker-init binary is backed by tini on default, but optionally can
be changed to docker-init by user preference.

so that would mean that the docker-init binary can be backed by docker-init...

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
