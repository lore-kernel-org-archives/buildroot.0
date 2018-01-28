From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 17:35:29 +0100
Subject: [Buildroot] buildroot imagw upgrade
In-Reply-To: <trinity-7ce85c6f-3278-4055-8377-0c3a03dd9a1a-1516300080914@3c-app-mailcom-bs09>
 (daggs@gmx.com's message of "Thu, 18 Jan 2018 19:28:00 +0100")
References: <trinity-7ce85c6f-3278-4055-8377-0c3a03dd9a1a-1516300080914@3c-app-mailcom-bs09>
Message-ID: <87shaqdjqm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "daggs" == daggs  <daggs@gmx.com> writes:

 > Greetings,
 > I'm thinking of creating an buildroot based image for a multi-use server.
 > the main issue that bugs me is the possibility of upgrade.
 > reinstalling the system takes time and I'd rather do upgrades instead.

 > does anyone has an idea on how to address such issue?

Ehh, I'm not sure I understand the question. To upgrade you presumably
just build a new image with Buildroot and write that to the server, just
like you would do for any embedded system?

-- 
Bye, Peter Korsgaard
