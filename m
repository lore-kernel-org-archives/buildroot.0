From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:22:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/snappy: remove pthread handling
 for static builds
In-Reply-To: <20170804040248.8773-1-bernd.kuhls@t-online.de>
References: <20170804040248.8773-1-bernd.kuhls@t-online.de>
Message-ID: <b8a46582-fd2b-e639-79c7-b759ec0b0187@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 06:02, Bernd Kuhls wrote:
> As pointed out by Thomas[1] the special handling of libpthread for
> static builds is not needed anymore.
> 
> Tested with the following musl & uclibc defconfigs which also fix build
> errors:
> http://autobuild.buildroot.net/results/39f/39f9fc4300ddca19e8a533765b46838003752000/
> http://autobuild.buildroot.net/results/886/8860b9259f7a3aecb2ddbfa787be048072bd347b/
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2017-July/199549.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, with an improved commit message from Baruch (whose Sob I
also added) and a remark about why -pthread is no longer needed as suggested by
Yann.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
