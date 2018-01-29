From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 21:09:03 +0100
Subject: [Buildroot] [PATCH 1/1] domoticz: depends on NPTL
In-Reply-To: <20180120112824.12236-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 20 Jan 2018 12:28:24 +0100")
References: <20180120112824.12236-1-fontaine.fabrice@gmail.com>
Message-ID: <87k1w05sww.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 > boost 1.66 uses pthread_condattr_setclock in
 > boost/asio/detail/impl/posix_event.ipp so add a dependency to
 > BR2_TOOLCHAIN_HAS_THREADS_NPTL

Shouldn't boost then depend on BR2_TOOLCHAIN_HAS_THREADS_NPTL (and
domoticz enherit it), or is this code only used in special cases?

-- 
Bye, Peter Korsgaard
