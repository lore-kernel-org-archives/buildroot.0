From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 21:31:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/vsftpd: add patch to fix hang
In-Reply-To: <20190305195440.25074-1-abdelmalek.benelouezzane@savoirfairelinux.com>
 (Abdelmalek Benelouezzane's message of "Tue, 5 Mar 2019 14:54:40
 -0500")
References: <20190305195440.25074-1-abdelmalek.benelouezzane@savoirfairelinux.com>
Message-ID: <87ef72fvx5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Abdelmalek" == Abdelmalek Benelouezzane <abdelmalek.benelouezzane@savoirfairelinux.com> writes:

 > This fixes a hang due to SIGCHLD not being handled correctly by
 > vsftpd. The patch comes from fedora and didn't make its way to
 > upstream yet.

 > More information about the bug can be found in:
 >  - https://bugzilla.redhat.com/show_bug.cgi?id=1198259

 > Signed-off-by: Abdelmalek Benelouezzane <abdelmalek.benelouezzane@savoirfairelinux.com>

Committed to 2018.02.x, 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
