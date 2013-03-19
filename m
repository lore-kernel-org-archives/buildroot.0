From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Mar 2013 22:43:02 +0100
Subject: [Buildroot] [PATCH v4 08/21] qt5base: install bundled fonts to
	target
In-Reply-To: <1363721394-14973-9-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 19 Mar 2013 20:29:41 +0100")
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363721394-14973-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87obefrrq1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Floris Bos <bos@je-eigen-domein.nl>
 Thomas> If not using font-config, Qt 5 offers a set of standard fonts to
 Thomas> use instead. Install these to target.

Should that then only happen if !BR2_PACKAGE_QT5BASE_FONTCONFIG?

-- 
Bye, Peter Korsgaard
