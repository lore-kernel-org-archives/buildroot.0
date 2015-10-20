From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Oct 2015 23:05:44 +0200
Subject: [Buildroot] Poison $(HOST_DIR)/usr/lib [was: Re: What is the
 preferred way install additional cmake modules?]
In-Reply-To: <CAHXCMMLkvFB0z-UiNgLyWjNWZCamBouyaRyyDHbXNF+OC+TG7g@mail.gmail.com>
References: <56267135.7050303@gmail.com> <20151020185409.GD3738@free.fr>
 <CAHXCMMLkvFB0z-UiNgLyWjNWZCamBouyaRyyDHbXNF+OC+TG7g@mail.gmail.com>
Message-ID: <5626ACA8.10001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-10-15 22:43, Samuel Martin wrote:
[snip]
> But this solution does not prevent from badly written module with
> absolute paths (pointing to some host binaries).
> This may be caught later during the build by the poison paths
> detection, but I doubt it can spot paths to the paths like
> <output>/host/usr/lib/; can it?

 It can't, but it probably should, since that is equally bad as /usr/lib.

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
