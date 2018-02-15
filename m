From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 11:37:10 +0100
Subject: [Buildroot] [git commit] docs/website/news.html: update for
 2018.02-rc1
In-Reply-To: <20180213211109.GA9763@australia.be.alcatel-lucent.com> (Thomas
 De Schampheleire's message of "Tue, 13 Feb 2018 22:11:09 +0100")
References: <20180205162551.1CB0E88432@busybox.osuosl.org>
 <20180213211109.GA9763@australia.be.alcatel-lucent.com>
Message-ID: <87y3jumtd5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <thomas.de_schampheleire@nokia.com> writes:

Hi,

 > I don't see this change reflected on the website:
 > https://buildroot.org/news.html
 > and likewise, the download page does not show the rc1 tarball.
 > Seems the update of the website went wrong somewhere?

Thanks for the heads up! It seems crond was acting up and the cronjob
handling the website hadn't been executed since Jan 28th. I've now
restarted it, so hopefully it should be running again now.

-- 
Bye, Peter Korsgaard
