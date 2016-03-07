From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Mar 2016 00:07:08 +0100
Subject: [Buildroot] [RFC PATCH 1/1] scripts: Add gen-package.py
In-Reply-To: <CAFOYHZDX9Ap8XSPuqKg8k-9+KA5qKB+DmhRH1FstXxMfkBG_7g@mail.gmail.com>
References: <1443426394-13595-1-git-send-email-judge.packham@gmail.com>
 <1443426394-13595-2-git-send-email-judge.packham@gmail.com>
 <20160306232248.4d37bcd2@free-electrons.com>
 <CAFOYHZDX9Ap8XSPuqKg8k-9+KA5qKB+DmhRH1FstXxMfkBG_7g@mail.gmail.com>
Message-ID: <56DE099C.9090404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/16 08:40, Chris Packham wrote:
> On Mon, Mar 7, 2016 at 11:22 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
[snip]
>> Another thing that would be useful is a "checkpackage" script, that
>> runs a bunch of verifications on a package (proper indentation, license
>> information filled in, etc.). But it is not trivial to do if you want
>> to check useful things.
>
> Such a script would have helped me with some of my submissions.

  Actually I have a skeleton of such a script lying around. Unfortunately, it 
never got into a state where it would actually check much, so I never submitted 
it. So I pushed it to [1] in case anyone is interested.


  Regards,
  Arnout


[1]
git fetch https://github.com/arnout/buildroot.git checkpackage


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
