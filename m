From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:31:00 +0200
Subject: [Buildroot] [PATCH v8 0/6] PATH cleanup
In-Reply-To: <1397514669-19362-1-git-send-email-s.martin49@gmail.com>
References: <1397514669-19362-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140416193100.482597c7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 15 Apr 2014 00:31:03 +0200, Samuel Martin wrote:

> Samuel Martin (6):
>   Makefile: introduce BR_PATH
>   Makefile: add $(HOST_DIR)/sbin to BR_PATH
>   *.mk: replace (TARGET|HOST)_PATH by BR_PATH
>   infra: remove unused {TARGET, HOST}_PATH definition
>   pkg-cmake.mk: add PATH in the configure command environment
>   Makefile: add PATH to the USER_HOOKS_EXTRA_ENV

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
