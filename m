From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 20:54:02 +0200
Subject: [Buildroot] [pull request v2] package/grub: drop grub-legacy
In-Reply-To: <cover.1506174552.git.yann.morin.1998@free.fr>
References: <cover.1506174552.git.yann.morin.1998@free.fr>
Message-ID: <1b806c34-b508-7f1c-3662-cb77151394ee@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-09-17 15:49, Yann E. MORIN wrote:
> Hello All!
> 
> This two-patch series removes grub, aka grub-legacy.
> 
> The reasioning is explained in the first patch, which actually gets rid
> of grub.
> 
> The second patch then removes grub support in the iso9660 filesystem, as
> grub is no longer available then.

 It seems more logical to do that first, so I swapped the two patches and
applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
