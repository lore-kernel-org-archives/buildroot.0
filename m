From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 23 Oct 2019 13:07:18 +0200
Subject: [Buildroot] [PATCH v2 0/9] Add netopeer2 package (and
 dependencies)
In-Reply-To: <f0d2200412feb981d8360cfa7d681959@walle.cc>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <f0d2200412feb981d8360cfa7d681959@walle.cc>
Message-ID: <CAEyMn7aqoWWJtAcg5CgvR+V2BEdTKVyvdaN_ja7XWfXTs81_EA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> The daemons (netconf server, sysrepod,..?) are missing the init
> scripts/systemd service files as well as the buildroot hooks for it,
> right?

With patch v3 a systemv init script was added to the packages.
