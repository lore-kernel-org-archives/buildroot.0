From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Feb 2021 11:37:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.16
In-Reply-To: <20210217222154.2144796-1-christian@paral.in> (Christian
 Stewart's message of "Wed, 17 Feb 2021 14:21:54 -0800")
References: <20210217222154.2144796-1-christian@paral.in>
Message-ID: <87o8ghy83l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Release notes: https://golang.org/doc/go1.16

The release notes mention changes for i386 machines without SSE support,
but you don't seem to be handling that?

-- 
Bye, Peter Korsgaard
