From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 10:36:51 +0100
Subject: [Buildroot] [PATCH] package/kodi: share the download dir with
 helper programs
In-Reply-To: <20191113204412.27018-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 13 Nov 2019 21:44:12 +0100")
References: <20191113204412.27018-1-yann.morin.1998@free.fr>
Message-ID: <87imngnr64.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The two helper programs TesturePackager and JsonSchemaBuilder are built
 > out of the same source tree as Kodi, so to avoid downloading the same
 > archive three times, let's them share the same download directory.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
