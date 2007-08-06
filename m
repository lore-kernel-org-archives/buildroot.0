From: Brad House <brad@mainstreetsoftworks.com>
Date: Mon, 06 Aug 2007 11:14:39 -0400
Subject: [Buildroot] [patch] php-5.2.3 package addition
In-Reply-To: <46B63485.8090609@mainstreetsoftworks.com>
References: <46B63485.8090609@mainstreetsoftworks.com>
Message-ID: <46B73ADF.3030104@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Attached is a patch to add php support.  I first submitted
> it to Gumstix's buildroot fork, where it has been committed
> for about a week and works...  Only a few minor changes were
> needed (building it for a Soekris box).

Slight modification to this patchset.  Libxml2 is known
as XML2 in Gumstix's buildroot fork, not 'libxml2'. I've
updated that reference here for this official buildroot
repository.

Also, this depends on the just-submitted libxml2 patchset.

Thanks.
-Brad
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: php-5.2.3-libxml2.patch
Url: http://busybox.net/lists/buildroot/attachments/20070806/7cb87e28/attachment.diff 
