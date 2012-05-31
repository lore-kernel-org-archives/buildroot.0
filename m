From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 May 2012 17:15:16 +0200
Subject: [Buildroot] Hiawatha webdav
In-Reply-To: <1338477136.92110.YahooMailNeo@web28407.mail.ukl.yahoo.com>
References: <1338472068.69082.YahooMailNeo@web28407.mail.ukl.yahoo.com>
 <20120531161554.7c63ce08@skate>
 <1338477136.92110.YahooMailNeo@web28407.mail.ukl.yahoo.com>
Message-ID: <20120531171516.652c8aa2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please don't reply to me directly. Keep the list in Cc. Thanks.

Le Thu, 31 May 2012 16:12:16 +0100 (BST),
Vincent de RIBOU <belzo2005-dolphin@yahoo.fr> a ?crit :

> Sorry for the confusion of revision not mentionned in my original message.
> I saw that and I put mainline GIT version to 8.3 and patch for SSL in place.
> 
> But I found no documentation about configuration option.
> Is it only "WebDAVapp = yes" to be configured for similar Apache DAV svn option??

I have never used the WebDAV support in Hiawatha, so I can't say for
sure, but from a quick read of the documentation and code, then yes, it
seems like setting WebDAVapp=yes in the configuration file is enough.
It enables HTTP verbs like PUT and DELETE, which are basically what is
needed for WebDAV, as far as I understand (my understanding of WebDAV
being quite limited).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
