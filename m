From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 17:50:32 +0100
Subject: [Buildroot] [PATCH] package/syslog-ng: fix build if net-snmp is
 installed on the host (again)
In-Reply-To: <20210120134008.31802-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 20 Jan 2021 14:40:07 +0100")
References: <20210120134008.31802-1-patrickdepinguin@gmail.com>
Message-ID: <87mtwt3t0n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > See also commit 4ff6e5239240a4e1bdf73c41d6e9bff9473ec62c which describes the
 > problem in detail.

 > The same problem now arises again, because syslog-ng renamed the
 > --enable-snmp-dest option into --enable-afsnmp. See syslog-ng commit
 > 4537938474771673ef5bd4a9cad7c9a7dc20b7c1, first part of 3.27.1.

 > Update the configure options passed from Buildroot accordingly.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.11.x (2020.02.x uses 3.24.1), thanks.

-- 
Bye, Peter Korsgaard
