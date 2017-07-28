From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Jul 2017 00:43:38 +0200
Subject: [Buildroot] [PATCH 1/1] host-mariadb: compile against bundled
 yassl
In-Reply-To: <20170728104440.12303-1-aduskett@gmail.com>
References: <20170728104440.12303-1-aduskett@gmail.com>
Message-ID: <a0203a79-5534-4285-0afa-836dcd8f7bfe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-07-17 12:44, Adam Duskett wrote:
> On Fedora26, openssl 1.1.x is included by default.  This causes build errors
> when building the host variant of mariadb.
> 
> Addings -DWITH_SSL=bundled fixes this issue.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>


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
