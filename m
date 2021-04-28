From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Apr 2021 12:12:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/uftrace: add missing dependency
 to comment
In-Reply-To: <20210426220815.521759-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 27 Apr 2021 00:08:15 +0200")
References: <20210426220815.521759-1-fontaine.fabrice@gmail.com>
Message-ID: <875z06d8fg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit f06d79255fbf0607200f1cc50a5dd87839295be3 forgot to add
 > BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS dependency to threads comment

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
