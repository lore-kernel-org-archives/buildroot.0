From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:04:42 +0200
Subject: [Buildroot] [PATCH 2/2] configs: Add qemu_ppc64le_pseries
In-Reply-To: <20170920024845.26157-3-joel@jms.id.au>
References: <20170920024845.26157-1-joel@jms.id.au>
 <20170920024845.26157-3-joel@jms.id.au>
Message-ID: <93dd5473-a4f7-c809-d256-3267868bf77c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-09-17 04:48, Joel Stanley wrote:
> This is similar to the ppc64_pseries config, except we build for little
> endian instead of big endian.
> 
> The default architecture is set to Power8 as this was the first fully
> enabled LE machine.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

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
