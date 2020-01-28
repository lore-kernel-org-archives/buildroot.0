From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 23:26:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/webkitgtk: security bump to
 version 2.26.3
In-Reply-To: <20200128072323.9204-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 28 Jan 2020 08:23:21 +0100")
References: <20200128072323.9204-1-peter@korsgaard.com>
Message-ID: <87ftfz6wuw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2019-8835: Multiple memory corruption issues were addressed with
 >   improved memory handling

 > - CVE-2019-8844: Multiple memory corruption issues were addressed with
 >   improved memory handling

 > - CVE-2019-8846: A use after free issue was addressed with improved memory
 >   management

 > For details, see the advisory:
 > https://webkitgtk.org/security/WSA-2020-0001.html

 > Drop now upstreamed patch.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
