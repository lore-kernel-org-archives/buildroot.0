From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 20:55:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/rocksdb: fix bzip2 option
In-Reply-To: <20200328132326.1120850-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Mar 2020 14:23:26 +0100")
References: <20200328132326.1120850-1-fontaine.fabrice@gmail.com>
Message-ID: <87eesznn1m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 95bf830e2ae6b5548c17fd3ce6ac1a8d2aa0c8b6 forgot to replace
 > ROCKSDB_CONF_OPTS by ROCKSDB_MAKE_OPTS for BR2_PACKAGE_BZIP2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
