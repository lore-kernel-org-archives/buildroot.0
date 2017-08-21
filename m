From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Aug 2017 21:35:30 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/lzo: switch to cmake
In-Reply-To: <20170820080744.8947-1-bernd.kuhls@t-online.de>
References: <20170820080744.8947-1-bernd.kuhls@t-online.de>
Message-ID: <8e8ea34e-3224-667a-5693-70a565dc49b7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-08-17 10:07, Bernd Kuhls wrote:
> +LZO_SUPPORTS_IN_SOURCE_BUILD = NO

 Why doesn't it support in-source build? Best to explain that in the commit message.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
