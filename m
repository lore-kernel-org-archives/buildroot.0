From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 09:59:10 +0200
Subject: [Buildroot] [PATCH 1/2] support/kconfig: upgrade to 3.9-rc2
In-Reply-To: <1365110666-3080-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 4 Apr 2013 23:24:24 +0200")
References: <1365110666-3080-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365110666-3080-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vc7twl9t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Our kconfig code is updated to the version of kernel 3.9-rc2. No major
 Thomas> issues during the migration, except:

 Thomas>  * Some conflicts when applying 03-change-config-option-prefix.patch
 Thomas>    due to upstream kernel changes.

 Thomas>  * The need of adding a new patch, 15-fix-qconf-moc-rule.patch, to fix
 Thomas>    the make rule that generates the moc file for the Qt-based
 Thomas>    interface.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
