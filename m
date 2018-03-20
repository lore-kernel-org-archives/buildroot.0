From: Christian Kellermann <christian.kellermann@solectrix.de>
Date: Tue, 20 Mar 2018 10:32:29 +0100
Subject: [Buildroot] Help setting up locales for tmux
Message-ID: <20180320093229.gwde5rwz6yfo3veo@sx4173-linuxdev.solectrix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear List,

I am trying to setup locales in a way, that tmux starts and I don't know
what to try next or how to debug the problem. I am using the 2018.02
release and have these in my config:

$ grep LOCALE .config
BR2_ENABLE_LOCALE=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US.UTF-8"
BR2_GENERATE_LOCALE="en_US.UTF-8"

I am using buildroot's toolchain with glibc.  tmux on the target starts
with complaining about a missing valid locale, although the env variables
LC_ALL, etc. are set to en_US.UTF-8.

Any hints?

Thanks,

Christian
