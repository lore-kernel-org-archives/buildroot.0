From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 19:39:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/openldap: bump to version 2.4.57
In-Reply-To: <20210124191114.1051458-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Jan 2021 20:11:14 +0100")
References: <20210124191114.1051458-1-fontaine.fabrice@gmail.com>
Message-ID: <87k0rw3nzc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > https://www.openldap.org/software/release/changes.html
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This fixes CVE-2020-36221..36230, so I've marked it as a security bump
and committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
