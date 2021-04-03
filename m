From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 09:48:22 +0200
Subject: [Buildroot] [PATCH 2/7] package/pkg-download.mk: add gitlab
 macro
In-Reply-To: <20210328191355.778786-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 28 Mar 2021 21:13:49 +0200")
References: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
 <20210328191355.778786-3-thomas.petazzoni@bootlin.com>
Message-ID: <877dljajw9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Just like we have a "github" macro to calculate the URL of the tarball
 > to download source from Github, let's introduce a similar macro for
 > Gitlab.

 > This should be used to download the auto-generated tarballs from
 > Gitlab. If there is a specific release tarball uploaded by the
 > upstream developers, the <pkg>_SITE variable should not use this new
 > gitlab macro.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x for easier backporting in the future, thanks.

-- 
Bye, Peter Korsgaard
