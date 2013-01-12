From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 21:00:07 +0100
Subject: [Buildroot] [PATCH] empty: needs MMU
In-Reply-To: <1357890528-3005-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 11 Jan 2013 07:48:48 +0000")
References: <1357890528-3005-1-git-send-email-spdawson@gmail.com>
Message-ID: <87ip726uk8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> The empty package uses the fork() system call, and so requires MMU.

 spdawson> Fixed autobuilder failures such as the following.

 spdawson>   http://autobuild.buildroot.net/results/4ad23e07b1bfe7bfd622aed8d54fa243b72eed59/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
