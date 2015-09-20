From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Sep 2015 12:39:31 +0200
Subject: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for
 runtime
In-Reply-To: <20150920102240.6e8db4f5@free-electrons.com>
References: <1442501193-6059-1-git-send-email-yba@tkos.co.il>
 <20150917150112.GR11632@tarshish>
 <alpine.DEB.2.02.1509171814510.13941@orcam81.orcam.lan>
 <20150917162003.GT11632@tarshish>
 <alpine.DEB.2.02.1509171922410.13941@orcam81.orcam.lan>
 <20150917192315.6db18115@free-electrons.com>
 <20150917190424.GU11632@tarshish>
 <20150917221546.247fe210@free-electrons.com>
 <alpine.DEB.2.11.1509192310350.1987@tanhuma.tkos.co.il>
 <20150920102240.6e8db4f5@free-electrons.com>
Message-ID: <55FE8CE3.4030402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-09-15 10:22, Thomas Petazzoni wrote:
> Jonathan,
> 
> On Sat, 19 Sep 2015 23:36:47 +0300 (IDT), Jonathan Ben Avraham wrote:
[snip]
>> I wonder if all of this is worth it. IMHO it would be enough to note in 
>> the gzip package help text that the user might need to adjust the 
>> hashbangs of the scripts in some post-build script.
> 
> There's some logic in the skeleton package that guarantees that /bin/sh
> points to the system shell selected by the user in his configuration.
> So forcing /bin/sh as the shebang should be fine.

 Well, if the scripts indeed require Bourne extensions, then possibly ash and
dash will not work... And I have no idea about zsh either.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
