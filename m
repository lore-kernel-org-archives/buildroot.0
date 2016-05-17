From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 08:53:01 +0200
Subject: [Buildroot] [PATCH 8/9] binutils: remove support for version
	2.23
In-Reply-To: <1463436782-17051-9-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 May 2016 00:13:01 +0200")
References: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463436782-17051-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87inydch0y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Now that we have added support for the lastest binutils version 2.26,
 > it is time to remove the oldest version we currently support, 2.23, in
 > order to keep only 3 versions: 2.24, 2.25 and 2.26.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > Changes since v2:
 >  - As suggested by Arnout, fix the previously existing
 >    BR2_BINUTILS_VERSION_2_23_2 legacy option to make it not select
 >    BR2_BINUTILS_VERSION_2_23_X, which is also a legacy option now, and
 >    update its help text.
 > Changes since v1:
 >   - Remove hash from the hash file, as noticed by Romain Naour.
 >   - Add Config.in.legacy entry, as noticed by Romain Naour.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
