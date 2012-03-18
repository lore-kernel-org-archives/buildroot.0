From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Mar 2012 22:36:20 +0100
Subject: [Buildroot] [PATCH 1/3] DOWNLOAD: change $1=DIRECTORY_URL,
	$2=FILE_NAME to $1=FULL_FILE_URL, $2=FILE_NAME
In-Reply-To: <1331905375-9177-1-git-send-email-alvaro.gamez@hazent.com>
 (Alvaro G. M.'s message of "Fri, 16 Mar 2012 14:42:53 +0100")
References: <1331905375-9177-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <87bontlhgr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alvaro" == Alvaro G M <alvaro.gamez@hazent.com> writes:

 Alvaro> From: "Alvaro G. M" <alvaro.gamez@hazent.com>

 Alvaro> This modifies the definition of DOWNLOAD to receive two
 Alvaro> arguments: the first one is the full URL of the file to
 Alvaro> download, whereas the second (and optional) is the name the
 Alvaro> file will have once downloaded.

 Alvaro> Same thing with the SOURCE_CHECK_WGET and SCP functions.

 Alvaro> All calls to these functions have been changed to the shortest
 Alvaro> form of the new API, except for toolchains acquisition. Since
 Alvaro> there is quite a number of different toolchains this call to
 Alvaro> DOWNLOAD is better set to the generic one.

Committed, thanks.

-- 
Bye, Peter Korsgaard
