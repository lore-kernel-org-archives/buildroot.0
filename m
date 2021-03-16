From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 22:37:13 +0100
Subject: [Buildroot] [PATCH] package/libjpeg: switch to s.b.o. as source
 site
In-Reply-To: <87v9a4a8v4.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 06 Mar 2021 11:12:47 +0100")
References: <20210306090446.2180129-1-yann.morin.1998@free.fr>
 <87v9a4a8v4.fsf@dell.be.48ers.dk>
Message-ID: <87eegezsom.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> The tarball for version 9d, released 2020-01-12, has been silently
 >> replaced upstream (a kinfd of BOM was removed from a few files),

 > Ahh, the Windows-style unicode byte order mark:

 > https://en.wikipedia.org/wiki/Byte_order_mark

 > Committed after adding the bugzilla reference, thanks.

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
