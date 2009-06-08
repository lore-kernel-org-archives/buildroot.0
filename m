From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  8 Jun 2009 21:09:21 +0000 (UTC)
Subject: [Buildroot] [Bug 373] Support for building gstreamer without libxml
In-Reply-To: <bug-373-163@https.bugs.busybox.net/>
References: <bug-373-163@https.bugs.busybox.net/>
Message-ID: <20090608210922.52AE87783B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=373





--- Comment #8 from Markus Heidelberg <markus.heidelberg@web.de>  2009-06-08 21:09:19 UTC ---
(In reply to comment #7)
> Created an attachment (id=381)
 --> (https://bugs.busybox.net/attachment.cgi?id=381) [details]
> Add support for building gstreamer without libxml2
> 
> 
> I've tweaked it a bti further to take into account comments. I haven't added
> the annodex change because I'm not sure it's worth it. It would only help a
> user who disabled the libxml2 dependency explicitly and then selected the
> annodex plugin that used libxml2.

I wasn't sure about the annodex plugin myself, that's why I wrote "I guess
...". Given that BR2_PACKAGE_GSTREAMER_LIBXML2 can be seen as an option to
disable registry and load/save with the side effect that libxml2 is not a
dependency anymore, I guess annodex doesn't have to be adjusted.

So I'm fine with this.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
