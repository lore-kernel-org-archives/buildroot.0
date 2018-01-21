From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Jan 2018 21:27:16 +0100
Subject: [Buildroot] [PATCH] iputils: fix ping and traceroute6
 executable permissions
In-Reply-To: <20180117232403.7bfb408f@windsurf> (Thomas Petazzoni's message of
 "Wed, 17 Jan 2018 23:24:03 +0100")
References: <1515874782-14986-1-git-send-email-tolvupostur@gmail.com>
 <20180117232403.7bfb408f@windsurf>
Message-ID: <871sijc5zv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 13 Jan 2018 21:19:42 +0100, tolvupostur at gmail.com wrote:
 >> From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
 >> 
 >> The iputils executables are installed without the setuid bit set,
 >> which prevents some programs from working.
 >> 
 >> This patch adds a post-install hook to fix the permissions of the
 >> ping and traceroute6 executables.

 > You didn't add a post-install hook, but a permission table.

 > I've applied after adjusting the commit log. Thanks!

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
