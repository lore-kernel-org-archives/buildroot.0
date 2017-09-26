From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:01:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/libshout: enable optional
 dependency for libressl
In-Reply-To: <20170923091949.2269-1-bernd.kuhls@t-online.de>
References: <20170923091949.2269-1-bernd.kuhls@t-online.de>
Message-ID: <0842acdd-ae8f-cde6-872f-67485dab62d5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-09-17 11:19, Bernd Kuhls wrote:
> libshout uses pkgconfig currently only to check for openssl paths, to
> fix the build error we pass our STAGING_DIR as parameter to
> --with-openssl
> 
> Fixes
> http://autobuild.buildroot.net/results/72a/72aa07d48d6b1d7dea046b88ee4aa943534ffad4/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
