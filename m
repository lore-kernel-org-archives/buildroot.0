From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Sep 2018 23:10:46 +0200
Subject: [Buildroot] [PATCH 3/3] qt5webkit: select leveldb package
In-Reply-To: <20180831202204.28093-4-gael.portay@savoirfairelinux.com>
References: <20180831202204.28093-1-gael.portay@savoirfairelinux.com>
 <20180831202204.28093-4-gael.portay@savoirfairelinux.com>
Message-ID: <01e51af4-335b-7b8b-7c03-c8c00960eb20@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/08/2018 22:22, Ga?l PORTAY wrote:
> +	depends on BR2_INSTALL_LIBSTDCPP # leveldb

 I don't think we need to propagate this particular dependency - qt5webkit
already depends on libstdcpp indirectly through Qt5.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
