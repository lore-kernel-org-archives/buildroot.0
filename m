From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 18:08:19 +0200
Subject: [Buildroot] [PATCH] package/collectd: don't remove
 postgresql_default.conf
In-Reply-To: <20200311141311.14785-1-p.debruijn@unilogic.nl> (Pascal de
 Bruijn's message of "Wed, 11 Mar 2020 15:13:11 +0100")
References: <20200311141311.14785-1-p.debruijn@unilogic.nl>
Message-ID: <87369fqnws.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

 > $(TARGET_DIR)/usr/share/collectd/postgresql_default.conf
 > should not be removed when postgresql support is enabled,
 > as that module tries to load that file by default.

 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
