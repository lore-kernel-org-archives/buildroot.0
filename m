From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:29:44 +0100
Subject: [Buildroot] [PATCH 1/2] package/webkitgtk: security bump to
 version 2.30.5
In-Reply-To: <20210216191651.23256-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 16 Feb 2021 20:16:49 +0100")
References: <20210216191651.23256-1-peter@korsgaard.com>
Message-ID: <878s7n3s2v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2020-13558: Processing maliciously crafted web content may lead to
 >   arbitrary code execution.  Description: A use after free issue in the
 >   AudioSourceProviderGStreamer class was addressed with improved memory
 >   management

 > For more details, see the advisory:
 > https://webkitgtk.org/security/WSA-2021-0001.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
