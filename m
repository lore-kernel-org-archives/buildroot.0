From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Dec 2014 00:38:42 +0100
Subject: [Buildroot] [PATCHv3 70/74] usbmount: install configuration
	file unconditionally
In-Reply-To: <1417357142-14307-71-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:18:58 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-71-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9373pq5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > As discussed, users should use a rootfs overlay or a post-build script
 > instead of a custom skeleton to override files installed by Buildroot,
 > so there is no point in having conditions when installing init scripts
 > or configuration files.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed with indentation fixed, thanks.

-- 
Bye, Peter Korsgaard
