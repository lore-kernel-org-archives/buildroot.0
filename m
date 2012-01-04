From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 4 Jan 2012 09:20:09 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.02/xenomai-update
In-Reply-To: <cover.1325623724.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325623724.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWgMLR=wXzEZUHnYu7D5F6Kgsinn+yGPu3OVvaanoFBsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 3, 2012 at 9:48 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> The following changes since commit
> 5528286147492aafa8740c09db63290042b79cb0:
>
>  rt-tests: fix build issues on uClibc (2012-01-03 09:15:17 +0100)
>
> are available in the git repository at:
>  http://free-electrons.com/~thomas/buildroot.gitfor-2012.02/xenomai-update
>
> Thomas Petazzoni (3):
>      xenomai: bump to 2.6.0
>      xenomai: restrict to the set of supported architectures
>      xenomai: mention which kernel versions are supported
>
>  linux/Config.ext.in                         |    8 +++
>  package/xenomai/Config.in                   |   62 +----------------------
>  package/xenomai/xenomai-fix-lfs-issue.patch |   72
> +++++++++++++++++++++++++++
>  package/xenomai/xenomai.mk                  |   11 +----
>  4 files changed, 83 insertions(+), 70 deletions(-)
>  create mode 100644 package/xenomai/xenomai-fix-lfs-issue.patch
>

Entire series:
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120104/0c46752a/attachment.html>
