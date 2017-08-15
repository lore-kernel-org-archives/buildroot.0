From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 18:18:30 +0200
Subject: [Buildroot] [PATCH] package/fakeroot: fix highly parallel uses
In-Reply-To: <20170813214834.24093-1-yann.morin.1998@free.fr>
References: <20170813214834.24093-1-yann.morin.1998@free.fr>
Message-ID: <c3a46dd3-57f1-6b84-dc93-23a4da8de50c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-08-17 23:48, Yann E. MORIN wrote:
> Although the issue can very well occur with low-paralle builds, or even
> with non-parallel builds, the conditions are so strict that the ocasion
> it breaks is extremely rare, to the point where a failure would go
> unnoticed.
> 
> Fixes #10141.
> 
> Reported-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

 As you noticed on IRC, applied to master, thanks.

 Clayton, for testing you can just use master.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
