From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Sep 2017 09:22:46 +0200
Subject: [Buildroot] [PATCH 31/49 v2] package/corosync: new package
In-Reply-To: <20170924205204.GA2575@scaer>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <752e6d4352e6b6254704028375d0a356f337bacc.1504993178.git.yann.morin.1998@free.fr>
 <8f21b4d7-1666-b31b-83b2-92dc4ceb2177@mind.be> <20170924205204.GA2575@scaer>
Message-ID: <4d3ff58b-44f0-c1a2-ed0c-c83ff17b1609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-09-17 22:52, Yann E. MORIN wrote:
>>> +	--disable-upstart \
>>> +	$(if $(BR2_INIT_SYSTEMD),--enable-systemd,--disable-systemd) \
>>  No dependency on systemd needed? It just installs units?
> Yes, it only installs unit files.

 Could you mention that in the commit message? Adding a comment for it is
probably overkill, but it's nice to have a record somewhere of such things.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
