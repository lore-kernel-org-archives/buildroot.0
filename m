From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Sep 2019 22:43:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/nilfs-utils: bump to version
 2.2.8
In-Reply-To: <20190918170338.31163-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 18 Sep 2019 19:03:38 +0200")
References: <20190918170338.31163-1-fontaine.fabrice@gmail.com>
Message-ID: <87sgosyq2q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Change NILFS_UTILS_SITE to https://nilfs.sourceforge.io as this is the
 >   official site with the official tarballs
 > - Remove first and third patch (already in version)
 > - Drop fourth patch and host-pkgconf from dependencies, not needed since
 >   https://github.com/nilfs-dev/nilfs-utils/commit/d5ce780856db5200917b69cd1049bd7b839ac6bb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
