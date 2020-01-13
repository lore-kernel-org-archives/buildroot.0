From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 21:18:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/parted: bump to version 3.3
In-Reply-To: <20200113193044.825053-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 13 Jan 2020 20:30:44 +0100")
References: <20200113193044.825053-1-fontaine.fabrice@gmail.com>
Message-ID: <874kwzaz5a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Remove all patches (already in version) as well as autoreconf
 > - Remove --disable-dynamic-loading (dropped since
 >   http://git.savannah.gnu.org/cgit/parted.git/commit/?id=b49388018931cab220b9dd50f3a2bd51401e48af)
 > - Add a dependency on locale as locale_t is unconditionnaly used since
 >   http://git.savannah.gnu.org/cgit/parted.git/commit/?id=9c266205416ec956d6205c828211480de3767d02

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
