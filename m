From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Feb 2018 00:30:10 +0100
Subject: [Buildroot] [PATCH 1/1] fs/cpio: add option to manually specify
 file list
In-Reply-To: <20180101154724.10ad21fc@windsurf>
References: <20171026191627.18949-1-sconnor@lynx.com>
 <20171026191627.18949-2-sconnor@lynx.com> <20180101125448.41ee4404@windsurf>
 <20180101132242.GB24931@scaer> <20180101154724.10ad21fc@windsurf>
Message-ID: <003f0c1a-2e72-1697-57cf-3df498902820@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-01-18 15:47, Thomas Petazzoni wrote:
[snip]
> So yeah, Seamus proposal is not ideal in terms of flexibility, but it
> does solve one common use-case with little complexity.

 I don't think it's a very common usecase. In fact, usually there will be some
additional files in the initramfs, e.g. to do a pivotroot.

 More importantly, though: the same result can be relatively easily achieved in
a POST_FAKEROOT_SCRIPT, and completely flexible.

 Regards,
 Arnout

> 
> Again, I'm not 100% convinced either, so it's good to have this
> discussion.
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
