From: Michael Walle <michael@walle.cc>
Date: Wed, 09 Oct 2019 17:57:21 +0200
Subject: [Buildroot] [PATCH v2 0/9] Add netopeer2 package (and
 dependencies)
In-Reply-To: <20191009112656.21232-1-heiko.thiery@gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
Message-ID: <f0d2200412feb981d8360cfa7d681959@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 2019-10-09 13:26, schrieb heiko.thiery at gmail.com:
> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> This patchset contains the netopeer2 package and the required
> dependencies. Netopeer2 is a set of tools implementing network
> configuration tools based on the NETCONF Protocol.

The daemons (netconf server, sysrepod,..?) are missing the init 
scripts/systemd service files as well as the buildroot hooks for it, 
right?

-michael
