From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Feb 2018 23:26:58 +0100
Subject: [Buildroot] [PATCH] package/efl: add in-tree eina library path
In-Reply-To: <20180206082114.3434-1-romain.naour@gmail.com>
References: <20180206082114.3434-1-romain.naour@gmail.com>
Message-ID: <2d5d47ac-c522-3640-5122-86adc82b3e3f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-02-18 09:21, Romain Naour wrote:
> Make sure that in-tree libeina.so is used when running elua.
> 
> Reported upstream:
> https://phab.enlightenment.org/T6670
> 
> Fixes:
> http://autobuild.buildroot.net/?reason=host-efl-1.20.6
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> There is an issue while rebuilding host-efl, elua is stuck at 100% cpu
> for some reason...

 I meant to ask you life, but forgot:

 Do you mean this problem occurs before or after this patch or both? Or do you
mean: when I reproduce the autobuild failure and then do "make host-efl-rebuild"
after changing something, elua is stuck at 100% cpu?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
