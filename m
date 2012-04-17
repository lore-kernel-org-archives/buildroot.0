From: Rico Bachmann <bachmann@tofwerk.com>
Date: Tue, 17 Apr 2012 12:59:29 +0200
Subject: [Buildroot] [PATCH v2] Add libapr-package
In-Reply-To: <Re:[PATCH] Add libapr-package>
References: <Re:[PATCH] Add libapr-package>
Message-ID: <1334660370-19506-1-git-send-email-bachmann@tofwerk.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


New Version of the patch whit the changes from Yegor

It doesn't work without the LIBAPR_SOURCE,
because it tries to download libapr-1.4.6.tar.gz instead of apr-1.4.6.tar.gz
