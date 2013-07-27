From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Jul 2013 11:22:13 -0300
Subject: [Buildroot] [PATCH] toolchain/buildroot: properly handle SSP
In-Reply-To: <20130727131824.69df5bf9@skate>
References: <1372962626-20736-1-git-send-email-gustavo@zacarias.com.ar>
 <20130727131824.69df5bf9@skate>
Message-ID: <51F3D795.6050402@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/2013 08:18 AM, Thomas Petazzoni wrote:

> Committed thanks. It would be nice to check whether something specific
> is needed for eglibc.

It's default on for eglibc as long as gcc supports -fstack-protector.
And it doesn't seem to care much if i try to disable it, though i'd be a
bit wary of doing so being upstream default.
Regards.
