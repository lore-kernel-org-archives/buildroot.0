From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 22:41:19 +0100
Subject: [Buildroot] [PATCH 1/1] unixodbc: needs dynamic library
In-Reply-To: <20190118220541.11023-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 18 Jan 2019 23:05:41 +0100")
References: <20190118220541.11023-1-fontaine.fabrice@gmail.com>
Message-ID: <87ef981g1s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1036ee061ce7f7747d5514c61866da60bcfae769

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/qt/Config.sql.in   | 4 ++++
 >  package/unixodbc/Config.in | 4 ++++
 >  2 files changed, 8 insertions(+)

You forgot to also propagate to the php unixodbc driver. Committed with
that fixed, thanks.

-- 
Bye, Peter Korsgaard
