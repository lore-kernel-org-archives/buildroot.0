From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 20:13:42 +0100
Subject: [Buildroot] [PATCH v3,
 1/6] package/libupnp: security bump to version 1.14.0
In-Reply-To: <20210125194949.1173139-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 25 Jan 2021 20:49:44 +0100")
References: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
Message-ID: <87bld83me1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CallStranger a.k.a. CVE-2020-12695 as well as CVE-2020-13848
 > - Update indentation in hash file (two spaces)
 > - Backport all changes from libupnp18 to libupnp:
 >   - Use COPYING instead of LICENSE (no license change)
 >   - Add host-pkgconf dependency
 >   - Add --enable-reuseaddr
 >   - Add openssl optional dependency

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v2 -> v3:
 >  - Rebase on current master

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
