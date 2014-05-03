From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 03 May 2014 19:45:09 +0200
Subject: [Buildroot] [PATCH v2 2/2] classpath: Use generic check for
	host	program
In-Reply-To: <1399125754-32118-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1399125754-32118-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1399125754-32118-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <44251a95-06f4-4cb8-95fb-5bf62b391646@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Hadjinlian <maxime.hadjinlian@gmail.com> schreef:
>Remove the specific check that was done in dependencies.sh to use the
>generic one that were introduced by the previous patch.
>
>Also, introduce, BR2_NEEDS_HOST_JAVAC and BR2_NEEDS_HOST_JAR.
>In a following patch, we will remove the specific check done for
>classpath, and the classpath package will use these generic variant.

This commit message is no longer accurate after moving some parts from the first patch...

But content-wise: 
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
