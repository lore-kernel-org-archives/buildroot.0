From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 08:18:05 +0100
Subject: [Buildroot] [PATCH v3 1/3] glibc: ensure BR2_MAKE is also used
 for subdirs
In-Reply-To: <20181119162515.20360-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 19 Nov 2018 17:25:13 +0100")
References: <20181119162515.20360-1-peter@korsgaard.com>
Message-ID: <87tvkcp68i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The configure script contains logic to figure out what make program to
 > invoke for subdirectories (trying gnumake, gmake, make).  Explicitly force
 > it to use our BR2_MAKE to ensure the right make version is used.

 > As GLIBC_CONF_ENV is only initialized below, move this section below it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > v3: No changes
 > v2:
 > - Fix CONV/CONF typo, move section below GLIBC_CONF_ENV initialization

Committed, thanks.

-- 
Bye, Peter Korsgaard
