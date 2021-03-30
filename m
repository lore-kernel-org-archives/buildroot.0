From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Mar 2021 08:18:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump to
 version 10.3.28
In-Reply-To: <20210329202613.293334-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Mar 2021 22:26:13 +0200")
References: <20210329202613.293334-1-fontaine.fabrice@gmail.com>
Message-ID: <875z19dv19.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-27928: A remote code execution issue was discovered in
 > MariaDB 10.2 before 10.2.37, 10.3 before 10.3.28, 10.4 before 10.4.18,
 > and 10.5 before 10.5.9; Percona Server through 2021-03-03; and the wsrep
 > patch through 2021-03-03 for MySQL. An untrusted search path leads to
 > eval injection, in which a database SUPER user can execute OS commands
 > after modifying wsrep_provider and wsrep_notify_cmd. NOTE: this does not
 > affect an Oracle product.

 > https://mariadb.com/kb/en/mariadb-10328-release-notes/
 > https://mariadb.com/kb/en/mariadb-10328-changelog/

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
