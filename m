From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jul 2021 09:34:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.9.6
In-Reply-To: <20210703210608.108834-1-aduskett@gmail.com> (Adam Duskett's
 message of "Sat, 3 Jul 2021 14:06:08 -0700")
References: <20210703210608.108834-1-aduskett@gmail.com>
Message-ID: <871r81wdqs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Other changes:
 >   - Rename 0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch to
 >     0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch, as to not
 >     overlap with 0034-Add-an-option-to-disable-the-berkeleydb-module.patch

Committed to 2021.02.x and 2021.05.x after dropping the rename (no
berkeleydb patch), thanks.

-- 
Bye, Peter Korsgaard
