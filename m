From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 21:43:38 +0200
Subject: [Buildroot] [PATCH v3 1/1] modem-manager: update to version
 1.8.0
In-Reply-To: <1528728713-11493-1-git-send-email-jared.bents@rockwellcollins.com>
 (Jared Bents's message of "Mon, 11 Jun 2018 09:51:53 -0500")
References: <1528728713-11493-1-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <87d0wxcdn9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jared" == Jared Bents <jared.bents@rockwellcollins.com> writes:

 > Update to modem manager 1.8.0 which does not require udev.
 > Added option to build without udev but if udev exists in
 > the build, it build with libgudev.

 > Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

 > --
 > [v2->v3]:
 > - Fixed typo removing endif in Config.in

 > [v1->v2]:
 > - Removed defaulted user option to select with udev and now
 >   automatically selects building with libgudev based on the
 >     presence of udev.

Committed, thanks.

-- 
Bye, Peter Korsgaard
