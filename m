From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 20:36:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: fix CVE-2020-9274
In-Reply-To: <20200328090042.950156-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Mar 2020 10:00:42 +0100")
References: <20200328090042.950156-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9mbnnx6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > An issue was discovered in Pure-FTPd 1.0.49. An uninitialized pointer
 > vulnerability has been detected in the diraliases linked list. When the
 > *lookup_alias(const char alias) or print_aliases(void) function is
 > called, they fail to correctly detect the end of the linked list and try
 > to access a non-existent list member. This is related to init_aliases in
 > diraliases.c.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
