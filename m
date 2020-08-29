From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 16:01:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump to
 version 12.4
In-Reply-To: <20200829112408.1063698-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Aug 2020 13:24:08 +0200")
References: <20200829112408.1063698-1-fontaine.fabrice@gmail.com>
Message-ID: <87eenpim9k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-14349: It was found that PostgreSQL versions before 12.4,
 >   before 11.9 and before 10.14 did not properly sanitize the search_path
 >   during logical replication. An authenticated attacker could use this
 >   flaw in an attack similar to CVE-2018-1058, in order to execute
 >   arbitrary SQL command in the context of the user used for replication.
 > - Fix CVE-2020-14350: It was found that some PostgreSQL extensions did
 >   not use search_path safely in their installation script. An attacker
 >   with sufficient privileges could use this flaw to trick an
 >   administrator into executing a specially crafted script, during the
 >   installation or update of such extension. This affects PostgreSQL
 >   versions before 12.4, before 11.9, before 10.14, before 9.6.19, and
 >   before 9.5.23.

 > https://www.postgresql.org/docs/12/release-12-4.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
