From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 00:30:35 +0100
Subject: [Buildroot] [PATCH/next v1 1/5] package/imagemagick: bump
 version to 7.0.10-62
In-Reply-To: <20210219230256.27955-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 20 Feb 2021 00:02:52 +0100")
References: <20210219230256.27955-1-ps.report@gmx.net>
Message-ID: <87blc6v23o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - bump version to 7.0.10-62
 > - update license file hash (copyright year update)

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

7.0.10-57 fixed a security issue:
https://security-tracker.debian.org/tracker/CVE-2021-20176

So I've reworded the commit message to make this clear and committed to
master, thanks.

-- 
Bye, Peter Korsgaard
