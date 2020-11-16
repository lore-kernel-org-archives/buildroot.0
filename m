From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 17:16:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump to
 version 12.5
In-Reply-To: <20201115105103.195998-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Nov 2020 11:51:03 +0100")
References: <20201115105103.195998-1-fontaine.fabrice@gmail.com>
Message-ID: <87mtzh5lbr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following CVEs:
 > - CVE-2020-25695: Multiple features escape "security restricted
 >   operation" sandbox
 > - CVE-2020-25694: Reconnection can downgrade connection security
 >   settings
 > - CVE-2020-25696: psql's \gset allows overwriting specially treated
 >   variables

 > https://www.postgresql.org/about/news/postgresql-131-125-1110-1015-9620-and-9524-released-2111

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
