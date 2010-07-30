From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 11:42:33 +0200
Subject: [Buildroot] [PATCH 01/19] dependencies: add svn as a mandatory
 tool
In-Reply-To: <AANLkTikhhj6v0Z0+kG1sgXQWz9FXurOJ2Z50nTNfCfZL@mail.gmail.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
	<3b207de011d13042b589031061bbe0d940e7b204.1280440124.git.thomas.petazzoni@free-electrons.com>
	<AANLkTikhhj6v0Z0+kG1sgXQWz9FXurOJ2Z50nTNfCfZL@mail.gmail.com>
Message-ID: <20100730114233.21156c3c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Jul 2010 10:37:43 +0100
Will Newton <will.newton@gmail.com> wrote:

> It seems like this might be a big dependency for people to install,
> particularly if they do not use these packages. Would it be better to
> make only those packages that require it depend on svn?

For the moment, we haven't entered the game in which we try to narrow
host dependencies to the particular package(s) that require it, just
because it was easier not to do so. Maybe it's time to change this, I
don't know.

However, it's sure that entering this game means adding yet another
level of configurability that is relatively hard to test (i.e checking
that each individual package properly lists all its mandatory
dependencies).

But I understand that having to install SVN (and later Git) is a bit
overkill.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
