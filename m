From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Jan 2017 17:11:07 +0100
Subject: [Buildroot] [PATCHv2] package/nut: bump version
In-Reply-To: <1483261256-18816-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 1 Jan 2017 10:00:56 +0100")
References: <1483261256-18816-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87o9zm24bo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Update our patches:
 >   - drop patch 1, replaced by an upstream equivalent; adapt config
 >     options and env accordingly,
 >   - drop patch 2, applied upstream,
 >   - rename patch 3

 > gdlib-config and net-snmp-config are only used when said support is
 > enabled (resp. CGI and SNMP), so no need to pass them unconditionally.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Changes v1 -> v2:
 >   - add missing SoB lines in patch 0001
 >   - fix commit title

Committed, thanks.

-- 
Bye, Peter Korsgaard
