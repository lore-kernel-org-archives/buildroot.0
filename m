From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Jun 2013 22:59:22 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: Add upstream patch to avoid
	occasional mdev SIGSEGV.
In-Reply-To: <20130611162412.GE18264@trismegisto.universo> (=?utf-8?Q?=22R?=
 =?utf-8?Q?a=C3=BAl_S=C3=A1nchez?=
 Siles"'s message of "Tue, 11 Jun 2013 18:24:12 +0200")
References: <20130611162412.GE18264@trismegisto.universo>
Message-ID: <871u884b4l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ra?l" == Ra?l S?nchez Siles <rasasi78@gmail.com> writes:

 Ra?l> This implies rename of previous patch for a correct patch ordering.
 Ra?l> Signed-off-by: Ra?l S?nchez Siles <rasasi78@gmail.com>
 Ra?l> ---
 Ra?l>  ...21.0-mdev.patch => busybox-1.21.0-mdev_1.patch} |    0
 Ra?l>  .../busybox-1.21.0-mdev_2_check_ACTION.patch       |   32 ++++++++++++++++++++

I would prefer to not rename the existing patch, as it makes it less
clear where it comes from (http://busybox.net/downloads/fixes-1.21.0/).

It shouldn't be necessary either as '.' comes before '_' (but not before
'-').

Talking of which, why is this patch not in the fixes directory? Does
Denys not consider it important enough?

-- 
Bye, Peter Korsgaard
