From: Will Newton <will.newton@gmail.com>
Date: Fri, 30 Jul 2010 10:37:43 +0100
Subject: [Buildroot] [PATCH 01/19] dependencies: add svn as a mandatory
	tool
In-Reply-To: <3b207de011d13042b589031061bbe0d940e7b204.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
	<3b207de011d13042b589031061bbe0d940e7b204.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <AANLkTikhhj6v0Z0+kG1sgXQWz9FXurOJ2Z50nTNfCfZL@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 29, 2010 at 10:48 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Now that two packages (tremor and libsvgtiny) are being downloaded
> from svn, svn becomes a mandatory tool to run Buildroot.

Hi Thomas,

It seems like this might be a big dependency for people to install,
particularly if they do not use these packages. Would it be better to
make only those packages that require it depend on svn?
